require "application_system_test_case"

class BlindDatesTest < ApplicationSystemTestCase
  setup do
    @blind_date = blind_dates(:one)
  end

  test "visiting the index" do
    visit blind_dates_url
    assert_selector "h1", text: "Blind Dates"
  end

  test "creating a Blind date" do
    visit blind_dates_url
    click_on "New Blind Date"

    fill_in "Lunch date", with: @blind_date.lunch_date
    click_on "Create Blind date"

    assert_text "Blind date was successfully created"
    click_on "Back"
  end

  test "updating a Blind date" do
    visit blind_dates_url
    click_on "Edit", match: :first

    fill_in "Lunch date", with: @blind_date.lunch_date
    click_on "Update Blind date"

    assert_text "Blind date was successfully updated"
    click_on "Back"
  end

  test "destroying a Blind date" do
    visit blind_dates_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blind date was successfully destroyed"
  end
end
