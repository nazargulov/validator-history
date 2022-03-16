class AddUniqMessageId < ActiveRecord::Migration[7.0]
  def change
    add_index :telegram_messages, :message_id, unique: true
    add_index :discord_messages, :discord_id, unique: true
  end
end
