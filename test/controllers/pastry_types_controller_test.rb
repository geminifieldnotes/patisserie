require "test_helper"

class PastryTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pastry_type = pastry_types(:one)
  end

  test "should get index" do
    get pastry_types_url
    assert_response :success
  end

  test "should get new" do
    get new_pastry_type_url
    assert_response :success
  end

  test "should create pastry_type" do
    assert_difference("PastryType.count") do
      post pastry_types_url, params: { pastry_type: { description: @pastry_type.description, name: @pastry_type.name } }
    end

    assert_redirected_to pastry_type_url(PastryType.last)
  end

  test "should show pastry_type" do
    get pastry_type_url(@pastry_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_pastry_type_url(@pastry_type)
    assert_response :success
  end

  test "should update pastry_type" do
    patch pastry_type_url(@pastry_type), params: { pastry_type: { description: @pastry_type.description, name: @pastry_type.name } }
    assert_redirected_to pastry_type_url(@pastry_type)
  end

  test "should destroy pastry_type" do
    assert_difference("PastryType.count", -1) do
      delete pastry_type_url(@pastry_type)
    end

    assert_redirected_to pastry_types_url
  end
end
