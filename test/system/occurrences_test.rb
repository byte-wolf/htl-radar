require "application_system_test_case"

class OccurrencesTest < ApplicationSystemTestCase
  setup do
    @occurrence = occurrences(:one)
  end

  test "visiting the index" do
    visit occurrences_url
    assert_selector "h1", text: "Occurrences"
  end

  test "creating a Occurrence" do
    visit occurrences_url
    click_on "New Occurrence"

    fill_in "Name", with: @occurrence.name
    fill_in "Start time", with: @occurrence.start_time
    click_on "Create Occurrence"

    assert_text "Occurrence was successfully created"
    click_on "Back"
  end

  test "updating a Occurrence" do
    visit occurrences_url
    click_on "Edit", match: :first

    fill_in "Name", with: @occurrence.name
    fill_in "Start time", with: @occurrence.start_time
    click_on "Update Occurrence"

    assert_text "Occurrence was successfully updated"
    click_on "Back"
  end

  test "destroying a Occurrence" do
    visit occurrences_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Occurrence was successfully destroyed"
  end
end
