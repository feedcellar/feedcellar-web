# coding: utf-8
#
# feedcellar-web.gemspec
#
# Copyright (C) 2013-2015  Masafumi Yokoyama <myokoym@gmail.com>
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

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'feedcellar/web/version'

Gem::Specification.new do |spec|
  spec.name          = "feedcellar-web"
  spec.version       = Feedcellar::Web::VERSION
  spec.authors       = ["Masafumi Yokoyama"]
  spec.email         = ["myokoym@gmail.com"]
  spec.description   = %q{Web interface for Feedcellar is a full-text searchable RSS feed reader by Rroonga.}
  spec.summary       = %q{Web interface for Feedcellar}
  spec.homepage      = "http://myokoym.net/feedcellar/"
  spec.license       = "LGPLv2.1+"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) {|f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency("feedcellar", ">= 0.6.0")
  spec.add_runtime_dependency("thor")
  spec.add_runtime_dependency("sinatra")
  spec.add_runtime_dependency("sinatra-contrib")
  spec.add_runtime_dependency("sinatra-cross_origin")
  spec.add_runtime_dependency("padrino-helpers")
  spec.add_runtime_dependency("kaminari")
  spec.add_runtime_dependency("haml")
  spec.add_runtime_dependency("launchy")
  spec.add_runtime_dependency("racknga")

  spec.add_development_dependency("test-unit")
  spec.add_development_dependency("test-unit-notify")
  spec.add_development_dependency("test-unit-rr")
  spec.add_development_dependency("bundler")
  spec.add_development_dependency("rake")
end
