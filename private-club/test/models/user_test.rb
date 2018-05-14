require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test sans first name
  test "when firstname is blank" do
    assert_not User.new(firstname: "", lastname: 'marcel', email: 'loulou@gmail.com').valid?
  end

  test "when firstname is full of space" do
    assert_not User.new(firstname: "      ", lastname: 'marcel', email: 'loulou@gmail.com').valid?
  end

  test "when firstname is same as one of the db" do
    User.create(firstname: "loulou", lastname: 'marcel', email: 'max@max.max')
    assert_not User.new(firstname: "loulou", lastname: 'marcel', email: 'max@max.max').valid?
  end

end
