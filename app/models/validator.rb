class Validator < ApplicationRecord
  has_many :telegram_messages
  has_many :discord_messages
end
