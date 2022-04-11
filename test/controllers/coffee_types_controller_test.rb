require "test_helper"

class CoffeeTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coffee_type = coffee_types(:one)
  end

  test "should get index" do
    get coffee_types_url
    assert_response :success
  end

  test "should show coffee_type" do
    get coffee_type_url(@coffee_type)
    assert_response :success
  end

    assert_redirected_to coffee_types_url
  end
end
