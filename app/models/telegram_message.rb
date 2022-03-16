class TelegramMessage < ApplicationRecord
  #  "name": "Umee Russian",
  #  "type": "public_supergroup",
  #  "id": 1564750228,
  belongs_to :validator, counter_cache: true
end
