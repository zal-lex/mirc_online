class OnlineChannel < ApplicationCable::Channel
  def subscribed
    current_user.update(online: true)
    logger.info "#{current_user} Subscribed to OnlineChannel. His online status: #{current_user.online}"
  end

  def unsubscribed
    current_user.update(online: false)
    logger.info "#{current_user} Unsubscribed to OnlineChannel. His online status: #{current_user.online}"
  end
end
