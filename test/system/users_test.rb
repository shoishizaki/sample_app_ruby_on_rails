require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit "/users"
  
    assert_selector "h1", text: "All Users"
  end
end
