class ScoreCard < ApplicationRecord

  belongs_to :user
  belongs_to :gameroom

  serialize :card_values , Array
  before_create :initilize_card_values


  def initilize_card_values
    self.card_values = [[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0]]
  end 
end
