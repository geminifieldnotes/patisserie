require "application_system_test_case"

class CoffeesTest < ApplicationSystemTestCase
  setup do
    @coffee = coffees(:one)
  end

  test "visiting the index" do
    visit coffees_url
    assert_selector "h1", text: "Coffees"
  end

  test "should create coffee" do
    visit coffees_url
    click_on "New coffee"

    fill_in "Description", with: @coffee.description
    fill_in "Name", with: @coffee.name
    fill_in "Price", with: @coffee.price
    click_on "Create Coffee"

    assert_text "Coffee was successfully created"
    click_on "Back"
  end

  test "should update Coffee" do
    visit coffee_url(@coffee)
    click_on "Edit this coffee", match: :first

    fill_in "Description", with: @coffee.description
    fill_in "Name", with: @coffee.name
    fill_in "Price", with: @coffee.price
    click_on "Update Coffee"

    assert_text "Coffee was successfully updated"
    click_on "Back"
  end

  test "should destroy Coffee" do
    visit coffee_url(@coffee)
    click_on "Destroy this coffee", match: :first

    assert_text "Coffee was successfully destroyed"
  end
end
