require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "return home page" do
    get "/"
    assert_equal 200, @response.status
  end
  
  test "return help page" do
    get "/help"
    assert_equal 200, @response.status
  end

  test "return about page" do
    get "/about"
    assert_equal 200, @response.status
  end

  test "return contact page" do
    get "/contact"
    assert_equal 200, @response.status
  end
  
  test "return microposts data" do
    get '/api/v1/static_pages.json'
    assert_equal 200, @response.status
    assert (microposts)
  end
end