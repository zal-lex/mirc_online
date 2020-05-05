class OnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_channel"
    current_user.update(online: true)
    broadcast_users
    logger.info "#{current_user} Subscribed to OnlineChannel. His online status: #{current_user.online}"
  end

  def unsubscribed
    current_user.update(online: false)
    broadcast_users
    logger.info "#{current_user} Unsubscribed to OnlineChannel. His online status: #{current_user.online}"
  end

  private

  def broadcast_users
    ActionCable.server.broadcast "online_channel", users: User.online.map(&:nickname)
  end
end
