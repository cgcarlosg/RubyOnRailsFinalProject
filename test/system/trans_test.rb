require "application_system_test_case"

class TransTest < ApplicationSystemTestCase
  setup do
    @tran = trans(:one)
  end

  test "visiting the index" do
    visit trans_url
    assert_selector "h1", text: "Trans"
  end

  test "creating a Tran" do
    visit trans_url
    click_on "New Tran"

    fill_in "Title", with: @tran.title
    fill_in "Total", with: @tran.total
    fill_in "User", with: @tran.user_id
    click_on "Create Tran"

    assert_text "Tran was successfully created"
    click_on "Back"
  end

  test "updating a Tran" do
    visit trans_url
    click_on "Edit", match: :first

    fill_in "Title", with: @tran.title
    fill_in "Total", with: @tran.total
    fill_in "User", with: @tran.user_id
    click_on "Update Tran"

    assert_text "Tran was successfully updated"
    click_on "Back"
  end

  test "destroying a Tran" do
    visit trans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tran was successfully destroyed"
  end
end
