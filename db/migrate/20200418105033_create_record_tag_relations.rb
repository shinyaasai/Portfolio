class CreateRecordTagRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :record_tag_relations do |t|
      t.references :record, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
