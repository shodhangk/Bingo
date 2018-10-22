class CreateScoreCards < ActiveRecord::Migration[5.2]
  def change
    create_table :score_cards do |t|
      t.integer :user_id
      t.integer :gameroom_id
      t.string :status

      t.timestamps
    end
  end
end
