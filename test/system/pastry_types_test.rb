require "application_system_test_case"

class PastryTypesTest < ApplicationSystemTestCase
  setup do
    @pastry_type = pastry_types(:one)
  end

  test "visiting the index" do
    visit pastry_types_url
    assert_selector "h1", text: "Pastry types"
  end

  test "should create pastry type" do
    visit pastry_types_url
    click_on "New pastry type"

    fill_in "Description", with: @pastry_type.description
    fill_in "Name", with: @pastry_type.name
    click_on "Create Pastry type"

    assert_text "Pastry type was successfully created"
    click_on "Back"
  end

  test "should update Pastry type" do
    visit pastry_type_url(@pastry_type)
    click_on "Edit this pastry type", match: :first

    fill_in "Description", with: @pastry_type.description
    fill_in "Name", with: @pastry_type.name
    click_on "Update Pastry type"

    assert_text "Pastry type was successfully updated"
    click_on "Back"
  end

  test "should destroy Pastry type" do
    visit pastry_type_url(@pastry_type)
    click_on "Destroy this pastry type", match: :first

    assert_text "Pastry type was successfully destroyed"
  end
end
