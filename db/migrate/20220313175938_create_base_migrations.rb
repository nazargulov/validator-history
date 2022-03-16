class CreateBaseMigrations < ActiveRecord::Migration[7.0]
  def change
    create_table :validators do |t|
      t.string :account_address#: "umee16qflfas8a9qjuskg9706n0926v8hac6ac5wgun"
      t.string :avatar#: "https://s3.images-iherb.com/static/i/me/i-herb-default-profile-icon.png"
      t.decimal :commission#: "0.200000000000000000"
      t.decimal :comulative_share#: 14.108882197234221
      t.string :consensus_address#: "umeevalcons10hk6sr7qnm75vmgtg4smslq6xewveuwrak6dp7"
      t.string :consensus_pubkey#: {@type#: "/cosmos.crypto.ed25519.PubKey", key#: "5Tpjyd5KMjVbNNSXTZ3H4Tkzw5ftD3n6zggfqekNFtY="}
      t.string :hex_address#: "7DEDA80FC09EFD466D0B4561B87C1A365CCCF1C3"
      t.string :identity#: "A51CE3B9CD649C3F"
      t.boolean :jailed#: false
      t.string :moniker#: "Polychain"
      t.string :operator_address#: "umeevaloper16qflfas8a9qjuskg9706n0926v8hac6acsf8de"
      t.integer :rank#: 1
      t.string :status#: "BOND_STATUS_BONDED"
      t.bigint :tokens#: 335160153237117
      t.decimal :uptime#: 100
      t.decimal :voting_power_percent#: 14.108882197234221
      t.string :telegram
      t.string :telegram_id
      t.string :discord
      t.string :twitter
      t.string :web_url
      t.string :medium
      t.timestamps
    end

    create_table :telegram_messages do |t|
      t.string :message_type # message, service
      t.datetime :date
      t.string :from
      t.string :from_id
      t.bigint :reply_to_message_id
      t.text :text
      t.bigint :message
      t.references :validator#, index: true
    end

    create_table :discord_messages do |t|
      t.string :discord_id
      t.string :message_type # message, service
      t.datetime :timestamp
      t.string :author_id
      t.string :author_name
      t.string :author_nickname
      t.string :author_discriminator
      t.text :content
      t.references :validator#, index: true
    end
  end
end
