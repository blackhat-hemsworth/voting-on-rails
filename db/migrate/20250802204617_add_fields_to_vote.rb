class AddFieldsToVote < ActiveRecord::Migration[8.0]
  def change
    add_column :votes, :n_selections, :integer
    add_column :votes, :choices, :string, array: true
  end
end
