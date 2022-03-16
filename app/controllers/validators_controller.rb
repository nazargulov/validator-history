class ValidatorsController < ActionController::Base
  layout "application"

  def index
    @validators = Validator.order("telegram_messages_count desc, discord_messages_count desc").all
  end

  def show
    @validator = Validator.find(params[:id])
    @telegram_messages = TelegramMessage
                           .where(validator_id: @validator.id)
                           .order('date desc')
                           .select('text, date, id, message_id')
  end

  def show_discord
    @validator = Validator.find(params[:id])
    @discord_messages = DiscordMessage
                          .where(validator_id: @validator.id)
                          .order('timestamp desc')
                          .select('content, timestamp, id, discord_id')
  end
end
