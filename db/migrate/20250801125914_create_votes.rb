class CreateVotes < ActiveRecord::Migration[8.0]
  def change
    create_table :votes do |t|
      t.string :selection, array: true

      t.timestamps
    end
  end
end
