require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  #概要：名前、email、password、password_confirmationが正常のため、
  #      ユーザー作成機能が成功する。
  #期待値：statas = 200、データベースにユーザーが存在する
  test "should success signup" do
    name = "example"
    email = "example@example.com"
    password = "foobar"
    password_confirmation = "foobar"
    activated = true
    post '/api/v1/users', params: {name: name, email: email, password: password, password_confirmation: password_confirmation, activated: activated}
    assert_equal 200, @response.status
    
    assert_equal 35, User.all.count
    user = User.find_by(email: email)
    assert_equal "example", user.name
  end
  
  #概要：nameが存在しないためユーザー作成に失敗する、
  #　　　ユーザーが増えていないことを確認する
  #期待値：status = 500、ユーザー数 = 34
  test "should fail signup by no name" do
    name = ""
    email = "example@example.com"
    password = "foobar"
    password_confirmation = "foobar"
    activated = true
    post '/api/v1/users', params: {name: name, email: email, password: password, password_confirmation: password_confirmation, activated: activated}
    assert_equal 500, @response.status
    
    assert_equal 34, User.all.count
  end
  
  #概要：emailが存在しないためユーザー作成に失敗する
  #　　　ユーザーが増えていないことを確認する
  #期待値：status = 500
  test "should fail signup by no email" do
    name = "example"
    email = ""
    password = "foobar"
    password_confirmation = "foobar"
    activated = true
    post '/api/v1/users', params: {name: name, email: email, password: password, password_confirmation: password_confirmation, activated: activated}
    assert_equal 500, @response.status
    
    assert_equal 34, User.all.count
  end
  
  #概要：passwordが存在しないためユーザー作成に失敗する
  #　　　ユーザーが増えていないことを確認する
  #期待値：status = 500
  test "should fail signup by no password" do
    name = "example"
    email = "example@example.com"
    password = ""
    password_confirmation = "foobar"
    activated = true
    post '/api/v1/users', params: {name: name, email: email, password: password, password_confirmation: password_confirmation, activated: activated}
    assert_equal 500, @response.status
    
    assert_equal 34, User.all.count
  end
  
  #概要：password_confirmationが存在しないためユーザー作成に失敗する
  #　　　ユーザーが増えていないことを確認する
  #期待値：status = 500
  test "should fail signup by no password_confirmation" do
    name = "example"
    email = "example@example.com"
    password = "foobar"
    password_confirmation = ""
    activated = true
    post '/api/v1/users', params: {name: name, email: email, password: password, password_confirmation: password_confirmation, activated: activated}
    assert_equal 500, @response.status
    
    assert_equal 34, User.all.count
  end
  
  #概要：passwordとpassword_confirmationが一致しないためユーザー作成に失敗する
  #　　　ユーザーが増えていないことを確認する
  #期待値：status = 500
  test "should fail signup because password and password confirmation do not match" do
    name = "example"
    email = "example@example.com"
    password = "foobar"
    password_confirmation = "Misscode"
    activated = true
    post '/api/v1/users', params: {name: name, email: email, password: password, password_confirmation: password_confirmation, activated: activated}
    assert_equal 500, @response.status
    
    assert_equal 34, User.all.count
  end
  
  #概要：ユーザー情報が正常に取得できている
  #期待値：status = 200
  test "should return users infomation" do
    get '/api/v1/users.json'
    assert_equal 200, @response.status
  end
  
end