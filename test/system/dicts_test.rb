require "application_system_test_case"

class DictsTest < ApplicationSystemTestCase
  setup do
    @dict = dicts(:one)
  end

  test "visiting the index" do
    visit dicts_url
    assert_selector "h1", text: "Dicts"
  end

  test "creating a Dict" do
    visit dicts_url
    click_on "New Dict"

    fill_in "Eword", with: @dict.eword
    fill_in "Jkana", with: @dict.jkana
    fill_in "Jword", with: @dict.jword
    click_on "Create Dict"

    assert_text "Dict was successfully created"
    click_on "Back"
  end

  test "updating a Dict" do
    visit dicts_url
    click_on "Edit", match: :first

    fill_in "Eword", with: @dict.eword
    fill_in "Jkana", with: @dict.jkana
    fill_in "Jword", with: @dict.jword
    click_on "Update Dict"

    assert_text "Dict was successfully updated"
    click_on "Back"
  end

  test "destroying a Dict" do
    visit dicts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dict was successfully destroyed"
  end
end
