class SessionsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", 
             password: "foobar", password_confirmation: "foobar")
    @user.save
  end

  #概要と期待値を記述する
  #テスト名 should ~
  #帰ってくる値があるか確認
  #チェックが多い→堅いシステム, 時間がかかる
  #前提条件がしっかりしてるか
  #テスト値をつくるのを最適化する
  #上級　並列化してテストを走らせる
  #バリデーションが効いているか（バグを起こさないため）
  #条件式が書いているものは付近を丁寧にテスト
  #テスト駆動開発もある
  
  #概要：ログインが成功する
  #期待値：status = 200
  test "login_success" do
    email = "user@example.com"
    password = "foobar"
    post "/api/v1/sessions" , params: { email: email , password: password}
    assert_equal 200, @response.status
  end
  
    #概要：emailが存在しないためログインに失敗する
  #期待値：status = 500
  test "login_failure_mistake_email" do
    email = "user1@example.com"
    password = "foobar"
    post "/api/v1/sessions", params: { email: email , password: password}
    assert_equal 500, @response.status
  end
  
  #概要：passwordのミスによりログインに失敗する
  #期待値：status = 500
  test "login_failure_mistake_password" do
    email = "user@example.com"
    password = "mistake"
    post "/api/v1/sessions" , params: { email: email , password: password}
    assert_equal 500, @response.status
  end
  
  #概要：ログアウトに成功する
  #期待値：delete urlを送りstatus=200、session=nilになっていることを確認
  test "should success logout" do
    email = "user@example.com"
    password = "foobar"
    post "/api/v1/sessions" , params: { email: email , password: password}
    delete "/api/v1/sessions/1.json"
    assert_equal 200, @response.status
    assert_nil session[:user_id]
  end

end
