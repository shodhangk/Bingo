class AddGameroomIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :gameroom_id, :integer
  end
end
