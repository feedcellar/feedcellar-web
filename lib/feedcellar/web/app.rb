# class Feedcellar::Web::App
#
# Copyright (C) 2014-2016  Masafumi Yokoyama <myokoym@gmail.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

require "feedcellar"
require "sinatra/base"
require "sinatra/json"
require "sinatra/cross_origin"
require "haml"
require "padrino-helpers"
require "kaminari/sinatra"

module Feedcellar
  module Web
    module PaginationProxy
      def limit_value
        page_size
      end

      def total_pages
        n_pages
      end
    end

    class App < Sinatra::Base
      helpers Kaminari::Helpers::SinatraHelpers
      register Sinatra::CrossOrigin

      get "/" do
        haml :index
      end

      get "/search" do
        search_and_paginate
        haml :index
      end

      get "/search.json" do
        cross_origin
        search_and_paginate
        feeds = @paginated_feeds || @feeds
        json feeds.collect {|feed| feed.attributes }
      end

      get "/registers.opml" do
        content_type :xml
        opml = nil
        GroongaDatabase.new.open(Command.new.database_dir) do |database|
          opml = Opml.build(database.resources.records)
        end
        opml
      end

      helpers do
        def search_and_paginate
          if params[:word]
            words = params[:word].split(" ")
          else
            words = []
          end
          options ||= {}
          options[:resource_id] = params[:resource_id] if params[:resource_id]
          options[:year] = params[:year].to_i if params[:year]
          options[:month] = params[:month].to_i if params[:month]
          @feeds = search(words, options)
          page = (params[:page] || 1).to_i
          size = (params[:n_per_page] || 50).to_i
          @paginated_feeds = @feeds.paginate([["date", :desc]],
                                   page: page,
                                   size: size)
          @paginated_feeds.extend(PaginationProxy)
          @paginated_feeds
        end

        def search(words, options={})
          database = GroongaDatabase.new
          database.open(Command.new.database_dir)
          GroongaSearcher.search(database, words, options)
        end

        def grouping(table)
          key = "resource"
          table.group(key).sort_by {|item| item.n_sub_records }.reverse
        end

        def drilled_url(resource)
          url("/search?resource_id=#{resource._id}&word=#{params[:word]}")
        end

        def drilled_label(resource)
          "#{resource.title} (#{resource.n_sub_records})"
        end

        def groonga_version
          Groonga::VERSION[0..2].join(".")
        end

        def rroonga_version
          Groonga::BINDINGS_VERSION.join(".")
        end
      end
    end
  end
end
