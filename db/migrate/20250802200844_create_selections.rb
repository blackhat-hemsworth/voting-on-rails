class CreateSelections < ActiveRecord::Migration[8.0]
  def change
    drop_table :selections
    create_table :selections do |t|
      t.belongs_to :vote, null: false, foreign_key: true
      t.string :selection

      t.timestamps
    end
  end
end
