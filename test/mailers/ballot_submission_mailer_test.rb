require "test_helper"

class BallotSubmissionMailerTest < ActionMailer::TestCase
  test "ballot_open" do
    mail = BallotSubmissionMailer.ballot_open
    assert_equal "Ballot open", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
