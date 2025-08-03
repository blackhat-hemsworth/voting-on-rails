class CreateBallots < ActiveRecord::Migration[8.0]
  def change
    create_table :ballots do |t|
      t.timestamps
    end
  end
end
