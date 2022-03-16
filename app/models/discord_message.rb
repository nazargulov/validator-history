class DiscordMessage < ApplicationRecord
  #"id": "940283450089435216",
  #    "type": "GuildTextChat",
  #  "categoryId": "940267986995003432",
  #  "category": "Mainnet Validators",
  #  "name": "\uD83D\uDCBB︱validator-general",
  GUILD_ID = '815699313581490196'
  CHANNEL_ID = '940283450089435216'
  belongs_to :validator, counter_cache: true

  def link
    "https://discord.com/channels/#{GUILD_ID}/#{CHANNEL_ID}/#{discord_id}"
  end
end
