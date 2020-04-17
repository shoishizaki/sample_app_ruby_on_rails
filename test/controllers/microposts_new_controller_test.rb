require 'test_helper'

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  
  #ユーザーを作成し、投稿できる環境を作成
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", 
            password: "foobar", password_confirmation: "foobar")
    @user.save
  end
  
  #user_idと投稿内容があり、正常に投稿できる場合
  #status = 200、データが保存されている
  test "should success post" do
    user_id = @user.id
    micropost = "success post"
    post '/api/v1/microposts', params: {user_id: user_id, micropost: micropost}
    assert_equal 200, @response.status
    
    get '/api/v1/static_pages.json'
    micropost = Micropost.find_by(user_id: user_id, content: micropost)
    assert(micropost)  
  end
  
  #user_idが存在しないため、投稿失敗
  #status = 500 が返ってくる
  test "should miss post by no user_id" do
    user_id = ""
    micropost = "miss post by no user"
    post '/api/v1/microposts', params: {user_id: user_id, micropost: micropost}
    assert_equal 500, @response.status
  end
  
  #投稿内容が無いためバリデーションで弾かれるため、投稿失敗
  #status = 500 が返ってくる
  test "should miss post　by validate" do
    user_id = @user.id
    micropost = ""
    post '/api/v1/microposts', params: {user_id: user_id, micropost: micropost}
    assert_equal 500, @response.status
  end
end