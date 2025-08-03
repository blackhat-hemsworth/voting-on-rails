class AddTopicToVote < ActiveRecord::Migration[8.0]
  def change
    add_column :votes, :topic, :string
  end
end
