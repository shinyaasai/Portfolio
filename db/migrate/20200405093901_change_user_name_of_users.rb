class ChangeUserNameOfUsers < ActiveRecord::Migration[5.1]
  def change
    def up
    change_column :users, :user_name, :string, default: ""
    end

# ↓は元々の状態

  def down
    change_column :users, :user_name, :string
  end
  end
end
