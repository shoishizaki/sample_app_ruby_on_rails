require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  
  #ユーザーを作成し、投稿できる環境を作成
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", 
            password: "foobar", password_confirmation: "foobar")
    @user.save
  end
  
  #概要：user_idと投稿内容があり、正常に投稿できる場合
  #期待値：status = 200、データが保存されている
  test "should success post" do
    user_id = @user.id
    post '/api/v1/microposts', params: {user_id: user_id, micropost: "success post"}
    assert_equal 200, @response.status
    
    get '/api/v1/static_pages.json'
    assert_equal 1, Micropost.all.count
    micropost = Micropost.find_by(user_id: user_id, content: micropost)
    assert_equal "success post",　micropost.content
    assert_equal 1, micropost.id
  end
  
  #期待値：user_idが存在しないため、投稿失敗
  #概要：status = 500 が返ってくる
  test "should miss post by no user_id" do
    user_id = ""
    micropost = "miss post by no user"
    post '/api/v1/microposts', params: {user_id: user_id, micropost: micropost}
    assert_equal 500, @response.status
  end
  
  #概要：投稿内容が無いためバリデーションで弾かれるため、投稿失敗
  #期待値：status = 500 が返ってくる
  test "should miss post　by validate" do
    user_id = @user.id
    micropost = ""
    post '/api/v1/microposts', params: {user_id: user_id, micropost: micropost}
    assert_equal 500, @response.status
  end
end