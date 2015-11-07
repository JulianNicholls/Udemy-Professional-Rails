require 'test_helper'

# Tests for reviews
class ReviewTest < ActiveSupport::TestCase
  def setup
    # @chef = Chef.new
    @review = Review.new rating: 5,
                         body: 'Mmm, tasty, but I need to say more than that',
                         recipe_id: 1, chef_id: 1
  end

  test 'Review should be valid' do
    assert @review.valid?
  end

  test 'body must be long enough' do
    @review.body = 'a' * 19

    assert_not @review.valid?
  end

  test 'rating must be between 1 and 5' do
    @review.rating = 6
    assert_not @review.valid?

    @review.rating = 0
    assert_not @review.valid?
  end
end
