class AddColumnToRecords2 < ActiveRecord::Migration[5.1]
  def change
    add_column :records, :getout, :integer
    add_column :records, :sleepiness, :integer
  end
end
