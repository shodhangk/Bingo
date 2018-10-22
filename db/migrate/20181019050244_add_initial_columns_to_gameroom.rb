class AddInitialColumnsToGameroom < ActiveRecord::Migration[5.2]
  def change
    add_column :gamerooms, :topic, :string
    add_column :gamerooms, :token, :string
  end
end
