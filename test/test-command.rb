# -*- coding: utf-8 -*-
#
# class CommandTest
#
# Copyright (C) 2015  Masafumi Yokoyama <myokoym@gmail.com>
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

require "fileutils"
require "stringio"
require "feedcellar/web/version"
require "feedcellar/web/command"

class CommandTest < Test::Unit::TestCase
  def setup
    @tmpdir = File.join(File.dirname(__FILE__), "tmp")
    FileUtils.rm_rf(@tmpdir)
    FileUtils.mkdir_p(@tmpdir)
    ENV["FEEDCELLAR_HOME"] = @tmpdir
    @command = Feedcellar::Web::Command.new
    @database_dir = @command.database_dir
  end

  def teardown
    FileUtils.rm_rf(@tmpdir)
  end

  def test_version
    s = ""
    io = StringIO.new(s)
    $stdout = io
    @command.version
    assert_equal("#{Feedcellar::Web::VERSION}\n", s)
    $stdout = STDOUT
  end
end
