class CreateDreamPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :dream_posts do |t|
      t.references :user, foreign_key: true, null: false
      t.references :record, foreign_key: true, null: false

      t.timestamps
    end
  end
end
