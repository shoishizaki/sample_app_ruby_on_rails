require "application_system_test_case"

class StaticPagesTest < ApplicationSystemTestCase

  # 概要:homeのページに移動した時にViewが表示されていることを確認する。
  # 期待値:見出し、ボタン、リンクがきちんと文字通り表示されている。
  test "visiting the home page" do
    visit "/"
  
    assert_selector "h1", text: "Welcome to the Sample App"
    assert_selector "h2", text: "This is the home page for the Ruby on Rails Tutorial and Vue.js sample application."
    assert_selector "button", text: "Sign Up now!"
    find_button("Sign Up now!").visible?
    find_link("Ruby on Rails Tutorial").visible?
    find_link("Vue.js").visible?
  end

  # 概要:signupのボタンを押して、signupページに移動していることを確認する。
  # 期待値:status = 200
  test "click signup button" do
    visit "/"
    click_button("Sign Up now!")
  end

  # 概要:Ruby on Rails Tutorialのリンクをクリックしてページを移動していることを確認する。
  # 期待値:status = 200
  test "click link Ruby on Rails Tutorial" do
    visit "/"
    click_link("Ruby on Rails Tutorial")
  end

  # 概要:Vue.jsのリンクをクリックしてページを移動していることを確認する。
  # 期待値:status = 200
  test "click link Vue.js" do
    visit "/"
    click_link("Vue.js")
  end

  # 概要:ログイン状態でhomeのページにアクセスした時の表示を確認する
  # 期待値:ログインユーザーのname, emailが表示され、ユーザーページに移動するリンクがある。投稿機能のテキストボックス 、投稿ボタンが表示されている。
  test "visiting the home page when status is login" do
    name = "example"
    email = "example@example.com"
    password = "foobar"
    password_confirmation = "foobar"
    activated = true
    post '/api/v1/users', params: {name: name, email: email, password: password, password_confirmation: password_confirmation, activated: activated}

    visit "/"
    assert_selector "p", text: "example"
    assert_selector "p", text: "example@example.com"
    assert_selector "a", text: "view my profile"
    assert_selector "h3", text: "MicroPost"
    find_field('textarea').visible?
    find_button("Post").visible?
  end

  # 概要:ログイン状態でhomeのページにアクセスして投稿する。
  # 期待値:投稿成功、投稿されたメッセージが表示されている。
  test "creating a post" do
    name = "example"
    email = "example@example.com"
    password = "foobar"
    password_confirmation = "foobar"
    activated = true
    post '/api/v1/users', params: {name: name, email: email, password: password, password_confirmation: password_confirmation, activated: activated}

    visit "/"
    fill_in "micropost", with: "Creating a post!"
    click_button("Post")

    assert_text "Creating a post!"
  end
end
