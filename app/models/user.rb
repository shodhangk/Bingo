class User < ApplicationRecord
  has_one :gameroom
  has_one :score_card
end
