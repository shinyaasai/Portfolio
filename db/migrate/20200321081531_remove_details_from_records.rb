class RemoveDetailsFromRecords < ActiveRecord::Migration[5.1]
  def change
    remove_column :records, :getup_time, :datetime
    remove_column :records, :sleep_time, :datetime
  end
end
