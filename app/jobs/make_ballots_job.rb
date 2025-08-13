class MakeBallotsJob < ApplicationJob
  queue_as :urgent

  def perform(ballots, participants)
   participants.each do |p|
      @ballot.make_submission(p)
   end
  end
end
