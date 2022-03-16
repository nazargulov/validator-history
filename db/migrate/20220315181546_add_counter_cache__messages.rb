class AddCounterCacheMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :validators, :telegram_messages_count, :integer, default: 0
    add_column :validators, :discord_messages_count, :integer, default: 0
  end
end
