require "application_system_test_case"

class CoffeeTypesTest < ApplicationSystemTestCase
  setup do
    @coffee_type = coffee_types(:one)
  end

  test "visiting the index" do
    visit coffee_types_url
    assert_selector "h1", text: "Coffee types"
  end

  test "should create coffee type" do
    visit coffee_types_url
    click_on "New coffee type"

    fill_in "Description", with: @coffee_type.description
    fill_in "Name", with: @coffee_type.name
    click_on "Create Coffee type"

    assert_text "Coffee type was successfully created"
    click_on "Back"
  end

  test "should update Coffee type" do
    visit coffee_type_url(@coffee_type)
    click_on "Edit this coffee type", match: :first

    fill_in "Description", with: @coffee_type.description
    fill_in "Name", with: @coffee_type.name
    click_on "Update Coffee type"

    assert_text "Coffee type was successfully updated"
    click_on "Back"
  end

  test "should destroy Coffee type" do
    visit coffee_type_url(@coffee_type)
    click_on "Destroy this coffee type", match: :first

    assert_text "Coffee type was successfully destroyed"
  end
end
