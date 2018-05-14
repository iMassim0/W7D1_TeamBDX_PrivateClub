require "application_system_test_case"

class UsersShowsTest < ApplicationSystemTestCase

  setup do
    @max = User.create(firstname: 'mas', lastname: 'simo', email: 'mass@imo.fr')
    @bab = User.create(firstname: 'bab', lastname: 'ounet', email: 'bab@ounet.fr')

  end

  test "1 - Visiting the index" do
    visit root_path
    click_link "Log in"
    fill_in "login", with: '1'
    click_button 'Log in now !'
    assert_selector "a", text: 'My Page'
  end

  test "2 - Inside my profile" do
    visit root_path
    click_link "Log in"
    fill_in "login", with: '1'
    click_button 'Log in now !'
    click_link 'My Page'
    assert_selector "h1", text: "Welcome #{@max.firstname} #{@max.lastname}"
    assert_selector "h2", text: "Your email : #{@max.email}"
  end

  test "3 - uniq access" do
    visit root_path
    click_link "Log in"
    fill_in "login", with: '1'
    click_button 'Log in now !'
    visit profile_path(@bab.id)
    assert_selector "h4", text: "ACCESS DENIED"
  end

end
