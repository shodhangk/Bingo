class AddUserIdToGameroom < ActiveRecord::Migration[5.2]
  def change
    add_column :gamerooms, :user_id, :integer
  end
end
