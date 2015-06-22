require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(name: "John Ffolkes-Smyth", email: "john@cheffy.com")
  end

  test "Chef should be valid" do
    assert @chef.valid?
  end

  test "Name should be present" do
    @chef.name = nil

    assert_not @chef.valid?
  end

  test "Name should be the right length" do
    @chef.name = 'aa'
    assert_not @chef.valid?

    @chef.name = "Long enough"
    assert @chef.valid?

    @chef.name = 'a' * 41
    assert_not @chef.valid?
  end

  test "Email should be present" do
    @chef.email = nil

    assert_not @chef.valid?
  end

  test "Email should be the right length" do
    @chef.email = 'a' * 101
    assert_not @chef.valid?
  end

  test "Email must be unique" do
    copy = @chef.dup
    @chef.save

    copy.email.upcase!    # Ensure case-insensitivity
    assert_not copy.valid?
  end

  test "Valid email addresses should be accepted" do
    valid_addresses = %w[user@user.com R_TDD-S@three.part.org first.last@corp.com user+name@any.com]

    valid_addresses.each do |addr|
      @chef.email = addr
      assert @chef.valid?, "#{addr.inspect} should be valid"
    end
  end

  test "Invalid email addresses must be rejected" do
    invalid_addresses = %w[user@user, R_TDD-S@three. first.last@corp@corp.com user_at_eee_org user@example,com]

    invalid_addresses.each do |addr|
      @chef.email = addr
      assert_not @chef.valid?, "#{addr.inspect} should NOT be valid"
    end
  end
end
