class AddSelectionToSelections < ActiveRecord::Migration[8.0]
  def change
    add_column :selections, :selection, :string
  end
end
