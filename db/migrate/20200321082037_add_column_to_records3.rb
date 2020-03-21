class AddColumnToRecords3 < ActiveRecord::Migration[5.1]
  def change
    add_column :records, :getup_time, :datetime
    add_column :records, :sleep_time, :datetime
  end
end
