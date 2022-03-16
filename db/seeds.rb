# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

validators = Validator.all
validators_by_moniker = validators.group_by(&:moniker)
if Validator.count.zero?
  path = File.join(File.dirname(__FILE__), "./seeds/validators.json")
  records = JSON.parse(File.read(path))
  records.each do |record|
    validator = validators_by_moniker[record['moniker']].first
    validator.avatar = record['avatar']
    validator.voting_power_percent = record['voting_power_percent']
    validator.save
    #Validator.update(record)
  end
  puts "validators are seeded"
end


#validators = Validator.where.not(telegram: nil)
#validators_by_tg = validators.group_by(&:telegram)
validators_by_tg_id = validators.group_by(&:telegram_id)
validators_by_discord = validators.group_by(&:discord)

tg_message_ids = TelegramMessage.all.map(&:message_id)

if TelegramMessage.count.zero?
  path = File.join(File.dirname(__FILE__), "./seeds/tg_umee_ru.json")
  records = JSON.parse(File.read(path))
  records.each do |record|
    next unless record['type'] == 'message'
    validator = Array(validators_by_tg_id[record['from_id']]).first
    next unless validator
    next if tg_message_ids.include?(record['id'])

    data = {}
    if record['text'].is_a?(Array)
      data['text'] = record['text'].map do |v|
        if v.is_a?(Hash)
          v['text']
        else
          v.to_s
        end
      end.compact.join(' ')
    else
      data['text'] = record['text'].to_s
    end
    data['message_type'] = record['type']
    data['date'] = DateTime.parse(record['date'])
    data['from'] = record['from']
    data['from_id'] = record['from_id']
    data['reply_to_message_id'] = record['reply_to_message_id']
    data['text'] = record['text']
    data['message_id'] = record['id']
    data['validator_id'] = validator.id
    TelegramMessage.create!(data)
  end
  puts "telegram messages are seeded"
end

dc_message_ids = DiscordMessage.all.map(&:discord_id)
unless DiscordMessage.count.zero?
  path = File.join(File.dirname(__FILE__), "./seeds/discord_umee_validator_general.json")
  records = JSON.parse(File.read(path))
  records['messages'].each do |record|
    next unless record['author']
    discord = record['author']['name'].to_s + "#" + record['author']['discriminator'].to_s
    next unless discord
    validator = Array(validators_by_discord[discord]).first
    next unless validator
    next if dc_message_ids.include?(record['id'])

    data = {}
    data['discord_id'] = record['id']
    data['message_type'] = record['type']
    data['timestamp'] = record['timestamp']
    data['author_id'] = record['']
    data['author_name'] = record['author']['id']
    data['author_nickname'] = record['author']['nickname']
    data['author_discriminator'] = record['author']['discriminator']
    data['content'] = record['content']
    data['validator_id'] = validator.id
    DiscordMessage.create!(data)
  end
  puts "discord messages are seeded"
end
