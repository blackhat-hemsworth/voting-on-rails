class RemoveSelectionFromVote < ActiveRecord::Migration[8.0]
  def change
    remove_column :votes, :selection, :string
  end
end
