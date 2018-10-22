class Gameroom < ApplicationRecord
  attr_accessor :title
  before_save :generate_token
  has_many :score_cards, dependent: :destroy
  has_many :players, through: :score_cards, source: "user", dependent: :destroy
  belongs_to :user

  def to_param
    self.token
  end

  def generate_token
    self.token = SecureRandom.hex(10)
  end
end
