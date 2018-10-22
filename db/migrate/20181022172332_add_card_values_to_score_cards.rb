class AddCardValuesToScoreCards < ActiveRecord::Migration[5.2]
  def change
    add_column :score_cards, :card_values, :text
  end
end
