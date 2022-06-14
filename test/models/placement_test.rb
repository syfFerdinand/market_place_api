require "test_helper"

class PlacementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @placement = placement(:one)
  end

  test 'decreases the product quantity by the placement quantity' do
    product = @placement.product

    assert_difference('product.quantity', -@placement.quantity) do
      @placement.decrement_product_quantity!
    end
  end
end
