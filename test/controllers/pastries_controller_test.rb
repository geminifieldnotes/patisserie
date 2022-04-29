require "test_helper"

class PastriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pastry = pastries(:one)
  end

  test "should get index" do
    get pastries_url
    assert_response :success
  end

  test "should get new" do
    get new_pastry_url
    assert_response :success
  end

  test "should create pastry" do
    assert_difference("Pastry.count") do
      post pastries_url, params: { pastry: { description: @pastry.description, name: @pastry.name, pastry_type_id: @pastry.pastry_type_id, price: @pastry.price } }
    end

    assert_redirected_to pastry_url(Pastry.last)
  end

  test "should show pastry" do
    get pastry_url(@pastry)
    assert_response :success
  end

  test "should get edit" do
    get edit_pastry_url(@pastry)
    assert_response :success
  end

  test "should update pastry" do
    patch pastry_url(@pastry), params: { pastry: { description: @pastry.description, name: @pastry.name, pastry_type_id: @pastry.pastry_type_id, price: @pastry.price } }
    assert_redirected_to pastry_url(@pastry)
  end

  test "should destroy pastry" do
    assert_difference("Pastry.count", -1) do
      delete pastry_url(@pastry)
    end

    assert_redirected_to pastries_url
  end
end
