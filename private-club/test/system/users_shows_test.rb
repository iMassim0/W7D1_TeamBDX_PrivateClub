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
    assert_selector "a", text: "mas's Page"
  end

  test "2 - Inside my profile" do
    visit root_path
    click_link "Log in"
    fill_in "login", with: '1'
    click_button 'Log in now !'
    assert_selector "h1", text: "Welcome mas simo!"
    assert_selector "h2", text: "Remember your Id : 1"
    click_link "mas's Page"
    # sa propre page show
    assert_selector "h1", text: "Your informations : mas simo"
    assert_selector "h2", text: "Your email : mass@imo.fr"
    # permet de mettre à jour que ses information
    assert_selector "a", text: "Update my informations"
  end

  test "3 - uniq access" do
    visit root_path
    click_link "Log in"
    fill_in "login", with: '1'
    click_button 'Log in now !'
    visit profile_path(@bab)
    # Show d'un autre profil fonctionne
    assert_selector "h1", text: "Profile of bab ounet"
    # Update des informations ne marche pas ici car user != current_user
    assert_no_selector "a", text: "Update my informations"
  end

  test "4 - modify another account?" do
    visit root_path
    click_link "Log in"
    fill_in "login", with: '1'
    click_button 'Log in now !'
    visit edit_user_path(@bab)
    assert_selector "p", text: "YOU DON'T HAVE PERMISSION"
  end

end
