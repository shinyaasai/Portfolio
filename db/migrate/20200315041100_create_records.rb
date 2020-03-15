class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.time             :getup_time
      t.time             :sleep_time
      t.integer          :awakening
      t.integer          :medicine
      t.integer          :sun
      t.text             :memo
      t.timestamps
    end
  end
end
