class ChangeDateGetupTimeToRecords < ActiveRecord::Migration[5.1]
  def change
     change_column :records, :getup_time, :datetime
  end
end
