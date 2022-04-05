require "application_system_test_case"

class BeansTest < ApplicationSystemTestCase
  setup do
    @bean = beans(:one)
  end

  test "visiting the index" do
    visit beans_url
    assert_selector "h1", text: "Beans"
  end

  test "should create bean" do
    visit beans_url
    click_on "New bean"

    fill_in "Description", with: @bean.description
    fill_in "Name", with: @bean.name
    click_on "Create Bean"

    assert_text "Bean was successfully created"
    click_on "Back"
  end

  test "should update Bean" do
    visit bean_url(@bean)
    click_on "Edit this bean", match: :first

    fill_in "Description", with: @bean.description
    fill_in "Name", with: @bean.name
    click_on "Update Bean"

    assert_text "Bean was successfully updated"
    click_on "Back"
  end

  test "should destroy Bean" do
    visit bean_url(@bean)
    click_on "Destroy this bean", match: :first

    assert_text "Bean was successfully destroyed"
  end
end
