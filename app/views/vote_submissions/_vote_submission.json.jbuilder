json.extract! vote_submission, :id, :created_at, :updated_at
json.url vote_submission_url(vote_submission, format: :json)
