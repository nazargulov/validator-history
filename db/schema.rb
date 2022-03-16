# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_16_195940) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discord_messages", force: :cascade do |t|
    t.string "discord_id"
    t.string "message_type"
    t.datetime "timestamp"
    t.string "author_id"
    t.string "author_name"
    t.string "author_nickname"
    t.string "author_discriminator"
    t.bigint "channel_id"
    t.bigint "channel_category_id"
    t.string "channel_category"
    t.string "channel_name"
    t.text "content"
    t.bigint "validator_id"
    t.index ["discord_id"], name: "index_discord_messages_on_discord_id", unique: true
    t.index ["validator_id"], name: "index_discord_messages_on_validator_id"
  end

  create_table "telegram_messages", force: :cascade do |t|
    t.string "message_type"
    t.datetime "date"
    t.string "from"
    t.string "from_id"
    t.bigint "reply_to_message_id"
    t.text "text"
    t.bigint "validator_id"
    t.integer "message_id"
    t.index ["message_id"], name: "index_telegram_messages_on_message_id", unique: true
    t.index ["validator_id"], name: "index_telegram_messages_on_validator_id"
  end

  create_table "validators", force: :cascade do |t|
    t.string "account_address"
    t.string "avatar"
    t.decimal "commission"
    t.decimal "comulative_share"
    t.string "consensus_address"
    t.string "consensus_pubkey"
    t.string "hex_address"
    t.string "identity"
    t.boolean "jailed"
    t.string "moniker"
    t.string "operator_address"
    t.integer "rank"
    t.string "status"
    t.bigint "tokens"
    t.decimal "uptime"
    t.decimal "voting_power_percent"
    t.string "telegram"
    t.string "telegram_id"
    t.string "discord"
    t.string "twitter"
    t.string "web_url"
    t.string "medium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "telegram_messages_count", default: 0
    t.integer "discord_messages_count", default: 0
  end

end
