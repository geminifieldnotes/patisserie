require "application_system_test_case"

class CoffeeBeansTest < ApplicationSystemTestCase
  setup do
    @coffee_bean = coffee_beans(:one)
  end

  test "visiting the index" do
    visit coffee_beans_url
    assert_selector "h1", text: "Coffee beans"
  end

  test "should create coffee bean" do
    visit coffee_beans_url
    click_on "New coffee bean"

    fill_in "Description", with: @coffee_bean.description
    fill_in "Name", with: @coffee_bean.name
    click_on "Create Coffee bean"

    assert_text "Coffee bean was successfully created"
    click_on "Back"
  end

  test "should update Coffee bean" do
    visit coffee_bean_url(@coffee_bean)
    click_on "Edit this coffee bean", match: :first

    fill_in "Description", with: @coffee_bean.description
    fill_in "Name", with: @coffee_bean.name
    click_on "Update Coffee bean"

    assert_text "Coffee bean was successfully updated"
    click_on "Back"
  end

  test "should destroy Coffee bean" do
    visit coffee_bean_url(@coffee_bean)
    click_on "Destroy this coffee bean", match: :first

    assert_text "Coffee bean was successfully destroyed"
  end
end
