require "application_system_test_case"

class AimsTest < ApplicationSystemTestCase
  setup do
    @aim = aims(:one)
  end

  test "visiting the index" do
    visit aims_url
    assert_selector "h1", text: "Aims"
  end

  test "creating a Aim" do
    visit aims_url
    click_on "New Aim"

    fill_in "Option1", with: @aim.option1
    fill_in "Option2", with: @aim.option2
    fill_in "Option3", with: @aim.option3
    fill_in "Option4", with: @aim.option4
    fill_in "Option5", with: @aim.option5
    click_on "Create Aim"

    assert_text "Aim was successfully created"
    click_on "Back"
  end

  test "updating a Aim" do
    visit aims_url
    click_on "Edit", match: :first

    fill_in "Option1", with: @aim.option1
    fill_in "Option2", with: @aim.option2
    fill_in "Option3", with: @aim.option3
    fill_in "Option4", with: @aim.option4
    fill_in "Option5", with: @aim.option5
    click_on "Update Aim"

    assert_text "Aim was successfully updated"
    click_on "Back"
  end

  test "destroying a Aim" do
    visit aims_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Aim was successfully destroyed"
  end
end
