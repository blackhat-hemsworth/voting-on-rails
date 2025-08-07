class AddNameToBallots < ActiveRecord::Migration[8.0]
  def change
    add_column :ballots, :name, :string
  end
end
