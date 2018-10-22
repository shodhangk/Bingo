class RemoveGameroomIdToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :gameroom_id, :integer

  end
end
