require "application_system_test_case"

class GrowshopsTest < ApplicationSystemTestCase
  setup do
    @growshop = growshops(:one)
  end

  test "visiting the index" do
    visit growshops_url
    assert_selector "h1", text: "Growshops"
  end

  test "creating a Growshop" do
    visit growshops_url
    click_on "New Growshop"

    fill_in "Description", with: @growshop.description
    fill_in "Location", with: @growshop.location
    fill_in "Name", with: @growshop.name
    click_on "Create Growshop"

    assert_text "Growshop was successfully created"
    click_on "Back"
  end

  test "updating a Growshop" do
    visit growshops_url
    click_on "Edit", match: :first

    fill_in "Description", with: @growshop.description
    fill_in "Location", with: @growshop.location
    fill_in "Name", with: @growshop.name
    click_on "Update Growshop"

    assert_text "Growshop was successfully updated"
    click_on "Back"
  end

  test "destroying a Growshop" do
    visit growshops_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Growshop was successfully destroyed"
  end
end
