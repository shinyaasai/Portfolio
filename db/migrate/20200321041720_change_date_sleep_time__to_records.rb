class ChangeDateSleepTimeToRecords < ActiveRecord::Migration[5.1]
  def change
    change_column :records, :sleep_time, :datetime
  end
end
