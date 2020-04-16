class SessionsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.new(name: "Example User", email: "user@example.com", 
             password: "foobar", password_confirmation: "foobar")
    @user.save
  end

  test "login_success" do
    setup()
    email = "user@example.com"
    password = "foobar"
    post "/api/v1/sessions" , params: { email: email , password: password}
    assert_equal 200, @response.status
  end

  test "login_failure_mistake_email" do
    setup()
    email = "user1@example.com"
    password = "foobar"
    post "/api/v1/sessions", params: { email: email , password: password}
    assert_equal 500, @response.status
  end
  
  test "login_failure_mistake_password" do
    setup()
    email = "user@example.com"
    password = "mistake"
    post "/api/v1/sessions" , params: { email: email , password: password}
    assert_equal 500, @response.status
  end

end
