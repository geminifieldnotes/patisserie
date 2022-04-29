require "application_system_test_case"

class PastriesTest < ApplicationSystemTestCase
  setup do
    @pastry = pastries(:one)
  end

  test "visiting the index" do
    visit pastries_url
    assert_selector "h1", text: "Pastries"
  end

  test "should create pastry" do
    visit pastries_url
    click_on "New pastry"

    fill_in "Description", with: @pastry.description
    fill_in "Name", with: @pastry.name
    fill_in "Pastry type", with: @pastry.pastry_type_id
    fill_in "Price", with: @pastry.price
    click_on "Create Pastry"

    assert_text "Pastry was successfully created"
    click_on "Back"
  end

  test "should update Pastry" do
    visit pastry_url(@pastry)
    click_on "Edit this pastry", match: :first

    fill_in "Description", with: @pastry.description
    fill_in "Name", with: @pastry.name
    fill_in "Pastry type", with: @pastry.pastry_type_id
    fill_in "Price", with: @pastry.price
    click_on "Update Pastry"

    assert_text "Pastry was successfully updated"
    click_on "Back"
  end

  test "should destroy Pastry" do
    visit pastry_url(@pastry)
    click_on "Destroy this pastry", match: :first

    assert_text "Pastry was successfully destroyed"
  end
end
