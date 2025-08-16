# Seeds file for rails_vote_collector_development:
require 'faker'

puts 'Seeding: Election'
election_1 = Election.create(name: 'dfl convention', description: 'longest day of my fucking life',
                             created_at: '2025-08-10 17:10:47 UTC', updated_at: '2025-08-10 17:10:47 UTC')

puts 'Seeding: Ballot'
ballot_1 = Ballot.create(election: election_1, created_at: '2025-08-10 17:11:51 UTC',
                         updated_at: '2025-08-10 17:11:51 UTC', name: 'ballot one')
ballot_5 = Ballot.create(election: election_1, created_at: '2025-08-10 21:38:02 UTC',
                         updated_at: '2025-08-10 21:38:02 UTC', name: 'third ballot')
ballot_11 = Ballot.create(election: election_1, created_at: '2025-08-10 22:32:10 UTC',
                          updated_at: '2025-08-10 22:32:10 UTC', name: 'last ballot')
ballot_16 = Ballot.create(election: election_1, created_at: '2025-08-10 23:22:39 UTC',
                          updated_at: '2025-08-10 23:22:39 UTC', name: 'ballot one')
puts 'Seeding: Participant'
participant_1 = Participant.create(election: election_1, created_at: '2025-08-10 17:21:49 UTC',
                                   updated_at: '2025-08-10 17:21:49 UTC', name: 'sally mcdemocrat', email: 'mcdem@hotmail.com')
participant_3 = Participant.create(election: election_1, created_at: '2025-08-10 20:58:18 UTC',
                                   updated_at: '2025-08-10 20:58:18 UTC', name: 'sam mcdemocrat', email: 'smcdem@netscape')
participant_4 = Participant.create(election: election_1, created_at: '2025-08-10 21:10:04 UTC',
                                   updated_at: '2025-08-10 21:10:04 UTC', name: 'jim republican', email: 'jim@photon.com')
100.times do
  Participant.create(election: election_1, created_at: '2025-08-10 21:10:04 UTC',
                     updated_at: '2025-08-10 21:10:04 UTC', name: Faker::Name.name, email: Faker::Internet.email)
end

puts 'Seeding: Vote'
vote_1 = Vote.create(method: :singleround, ballot: ballot_1, created_at: '2025-08-10 17:11:51 UTC', updated_at: '2025-08-10 17:11:51 UTC',
                     n_selections: 1, topic: 'stupid sandwich joke')
vote_5 = Vote.create(method: :singleround, ballot: ballot_5, created_at: '2025-08-10 21:38:02 UTC', updated_at: '2025-08-10 21:38:02 UTC',
                     n_selections: 1, topic: 'mayor')
vote_6 = Vote.create(method: :singleround, ballot: ballot_5, created_at: '2025-08-10 21:38:02 UTC', updated_at: '2025-08-10 21:38:02 UTC',
                     n_selections: 3, topic: 'parks and rec')
vote_12 = Vote.create(method: :singleround, ballot: ballot_11, created_at: '2025-08-10 22:32:10 UTC', updated_at: '2025-08-10 22:32:10 UTC',
                      n_selections: 1, topic: 'mayoral race')
vote_13 = Vote.create(method: :multidroplast, ballot: ballot_11, created_at: '2025-08-10 22:32:10 UTC', updated_at: '2025-08-10 22:32:10 UTC',
                      n_selections: 3, topic: 'parkboard')
vote_18 = Vote.create(method: :singleround, ballot: ballot_16, created_at: '2025-08-10 23:22:39 UTC', updated_at: '2025-08-10 23:22:39 UTC',
                      n_selections: 2, topic: 'mayor')

# (Skipping Selection as it has no rows)
puts 'Seeding: VoteChoice'

for joke in [ "ketchup", "smoothie", "ew" ] do
 VoteChoice.create(vote: vote_1, created_at: '2025-08-10 22:35:13 UTC',
                                  updated_at: '2025-08-10 22:35:13 UTC', droppable: true, choice: joke)
end
vote_choice_1 = VoteChoice.create(vote: vote_13, created_at: '2025-08-10 22:35:13 UTC',
                                  updated_at: '2025-08-10 22:35:13 UTC', droppable: true, choice: 'Michael')
vote_choice_1 = VoteChoice.create(vote: vote_13, created_at: '2025-08-10 22:35:13 UTC',
                                  updated_at: '2025-08-10 22:35:13 UTC', droppable: true, choice: 'Amber')
vote_choice_1 = VoteChoice.create(vote: vote_13, created_at: '2025-08-10 22:35:13 UTC',
                                  updated_at: '2025-08-10 22:35:13 UTC', droppable: true, choice: 'Tom')
vote_choice_1 = VoteChoice.create(vote: vote_13, created_at: '2025-08-10 22:35:13 UTC',
                                  updated_at: '2025-08-10 22:35:13 UTC', droppable: true, choice: 'Weirdo 1')
vote_choice_1 = VoteChoice.create(vote: vote_13, created_at: '2025-08-10 22:35:13 UTC',
                                  updated_at: '2025-08-10 22:35:13 UTC', droppable: true, choice: 'Weirdo 2')
vote_choice_1 = VoteChoice.create(vote: vote_13, created_at: '2025-08-10 22:35:13 UTC',
                                  updated_at: '2025-08-10 22:35:13 UTC', droppable: true, choice: 'Paula Chestnut')
vote_choice_5 = VoteChoice.create(vote: vote_12, created_at: '2025-08-10 23:22:39 UTC',
                                  updated_at: '2025-08-10 23:22:39 UTC', droppable: true, choice: 'frey')
vote_choice_6 = VoteChoice.create(vote: vote_12, created_at: '2025-08-10 23:22:39 UTC',
                                  updated_at: '2025-08-10 23:22:39 UTC', droppable: true, choice: 'fateh')
vote_choice_7 = VoteChoice.create(vote: vote_12, created_at: '2025-08-10 23:22:39 UTC',
                                  updated_at: '2025-08-10 23:22:39 UTC', droppable: true, choice: 'brenda')
vote_choice_8 = VoteChoice.create(vote: vote_12, created_at: '2025-08-10 23:22:39 UTC',
                                  updated_at: '2025-08-10 23:22:39 UTC', droppable: true, choice: 'jazz')
vote_choice_9 = VoteChoice.create(vote: vote_12, created_at: '2025-08-10 23:22:39 UTC',
                                  updated_at: '2025-08-10 23:22:39 UTC', droppable: true, choice: 'davis')
vote_choice_10 = VoteChoice.create(vote: vote_12, created_at: '2025-08-10 23:22:39 UTC',
                                   updated_at: '2025-08-10 23:22:39 UTC', droppable: false, choice: 'no endorsement')
vote_choice_11 = VoteChoice.create(vote: vote_12, created_at: '2025-08-10 23:22:39 UTC',
                                   updated_at: '2025-08-10 23:22:39 UTC', droppable: false, choice: 'abstain')
vote_choice_5 = VoteChoice.create(vote: vote_18, created_at: '2025-08-10 23:22:39 UTC',
                                  updated_at: '2025-08-10 23:22:39 UTC', droppable: true, choice: 'frey')
vote_choice_6 = VoteChoice.create(vote: vote_18, created_at: '2025-08-10 23:22:39 UTC',
                                  updated_at: '2025-08-10 23:22:39 UTC', droppable: true, choice: 'fateh')
vote_choice_7 = VoteChoice.create(vote: vote_18, created_at: '2025-08-10 23:22:39 UTC',
                                  updated_at: '2025-08-10 23:22:39 UTC', droppable: true, choice: 'brenda')
vote_choice_8 = VoteChoice.create(vote: vote_18, created_at: '2025-08-10 23:22:39 UTC',
                                  updated_at: '2025-08-10 23:22:39 UTC', droppable: true, choice: 'jazz')
vote_choice_9 = VoteChoice.create(vote: vote_18, created_at: '2025-08-10 23:22:39 UTC',
                                  updated_at: '2025-08-10 23:22:39 UTC', droppable: true, choice: 'davis')
vote_choice_10 = VoteChoice.create(vote: vote_18, created_at: '2025-08-10 23:22:39 UTC',
                                   updated_at: '2025-08-10 23:22:39 UTC', droppable: false, choice: 'no endorsement')
vote_choice_11 = VoteChoice.create(vote: vote_18, created_at: '2025-08-10 23:22:39 UTC',
                                   updated_at: '2025-08-10 23:22:39 UTC', droppable: false, choice: 'abstain')

# b = Ballot.where(election_id: 1).last
# p = Participant.where(:election_id == 1).first
# bs = b.make_submission(p)
