require "application_system_test_case"
# exo 2.2
class UsersText < ApplicationSystemTestCase

  test "1 - links avaible in home page" do
    visit root_path
    assert_selector "a", text: "Sign up now"
    assert_selector "a", text: "Log in now"
  end

  test "2 - can't create 2 accounts with the same email" do
    User.create(firstname: 'mas', lastname: 'simo', email: 'massimo@gmail.com')
    visit root_path
    click_link "Sign up"
    fill_in 'firstname', with: 'bab'
    fill_in 'lastname', with: 'bab'
    fill_in 'email', with: 'massimo@gmail.com'
    click_button 'Create my account'
    assert_selector "h4", text: "Email has already been taken"
  end

  test "2 - can't create account if one of the input is blank" do
    visit signup_path
    fill_in 'firstname', with: 'max'
    fill_in 'lastname', with: ''
    fill_in 'email', with: 'massimo@gmail.com'
    click_button 'Create my account'
    assert_selector "h4", text: "Lastname can't be blank"
    fill_in 'firstname', with: ''
    fill_in 'lastname', with: 'max'
    fill_in 'email', with: 'massimo@gmail.com'
    click_button 'Create my account'
    assert_selector "h4", text: "Firstname can't be blank"
  end

  test "3 - Connect with wrong ID, and good ID" do
    User.create(firstname: 'mas', lastname: 'simo', email: 'mass@imo.fr')
    visit login_path
    fill_in "login", with: ''
    click_button 'Log in now !'
    assert_selector "h4", text: "Id inconnue"
    fill_in "login", with: '1'
    click_button 'Log in now !'
    assert_selector "h4", text: "Welcome! Access permitted!"
  end

  test "4 - Test navbar" do
    User.create(firstname: 'mas', lastname: 'simo', email: 'mass@imo.fr')
    visit root_path
    assert_selector "a", text: "Sign up"
    assert_selector "a", text: "Log in"
    click_link "Log in"
    fill_in "login", with: '1'
    click_button 'Log in now !'
    assert_selector "a", text: "Log out"
  end

  test "5 - When connected or not, list ok ?" do
    User.create(firstname: 'mas', lastname: 'simo', email: 'mass@imo.fr')
    visit index_path
    assert_no_selector 'table'
    visit root_path
    click_link "Log in"
    fill_in "login", with: '1'
    click_button 'Log in now !'
    visit index_path
    assert_selector 'table'
    within 'table' do
      assert_selector 'tr th', text: 'ID'
      assert_selector 'tr th', text: 'Firstname'
      assert_selector 'tr th', text: 'Lastname'
      assert_selector 'tr th', text: 'Email'
      assert_selector 'tr th', text: 'Valid'
    end
  end

end
