require "application_system_test_case"

class VoteSubmissionsTest < ApplicationSystemTestCase
  setup do
    @vote_submission = vote_submissions(:one)
  end

  test "visiting the index" do
    visit vote_submissions_url
    assert_selector "h1", text: "Vote submissions"
  end

  test "should create vote submission" do
    visit vote_submissions_url
    click_on "New vote submission"

    click_on "Create Vote submission"

    assert_text "Vote submission was successfully created"
    click_on "Back"
  end

  test "should update Vote submission" do
    visit vote_submission_url(@vote_submission)
    click_on "Edit this vote submission", match: :first

    click_on "Update Vote submission"

    assert_text "Vote submission was successfully updated"
    click_on "Back"
  end

  test "should destroy Vote submission" do
    visit vote_submission_url(@vote_submission)
    click_on "Destroy this vote submission", match: :first

    assert_text "Vote submission was successfully destroyed"
  end
end
