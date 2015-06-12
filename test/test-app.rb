require "rack/test"

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    @app ||= Rack::Builder.parse_file("config.ru").first
  end

  def test_index
    get "/"
    assert_true(last_response.ok?)
  end

  def test_search
    get "/search"
    assert_true(last_response.ok?)
  end

  def test_search_json
    get "/search.json"
    assert_true(last_response.ok?)
  end

  def test_registers
    get "/registers.opml"
    assert_true(last_response.ok?)
  end
end
