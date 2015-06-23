require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    chef = Chef.create(name: "Bob", email: "bob@example.com", password: "foobar",
                       password_confirmation: 'foobar')
    @recipe = chef.recipes.build(name: "Spicy Meatballs", summary: "Now, that's a spicy meatball!",
                         description: "Meatballs with spice", chef: chef)
  end

  test "Recipe should be valid" do
    assert @recipe.valid?, @recipe.errors.full_messages
  end

  test "chef_id must be present" do
    @recipe.chef_id = nil

    assert_not @recipe.valid?
  end

  test "name must be present" do
    @recipe.name = nil

    assert_not @recipe.valid?
  end

  test "name must be the correct length" do
    @recipe.name = "a" * 4
    assert_not @recipe.valid?

    @recipe.name = "This is plenty long enough"
    assert @recipe.valid?, @recipe.errors

    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end

  test "Summary must be present" do
    @recipe.summary = nil

    assert_not @recipe.valid?
  end

  test "Summary must be the correct length" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?

    @recipe.summary = "This is plenty long enough"
    assert @recipe.valid?

    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end

  test "Description must be present" do
    @recipe.description = nil

    assert_not @recipe.valid?
  end

  test "Description must be the correct length" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?

    @recipe.description = "This is plenty long enough"
    assert @recipe.valid?

    @recipe.description = "a" * 601
    assert_not @recipe.valid?
  end
end
