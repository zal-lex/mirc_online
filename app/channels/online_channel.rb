class OnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_channel"
    OnlineService.new(user: current_user).make_online!
    broadcast_users
    logger.info "#{current_user} Subscribed to OnlineChannel. His online status: #{current_user.online}"
  end

  def unsubscribed
    OnlineService.new(user: current_user).make_offline!
    broadcast_users
    logger.info "#{current_user} Unsubscribed to OnlineChannel. His online status: #{current_user.online}"
  end

  private

  def broadcast_users
    ActionCable.server.broadcast "online_channel", users: User.online.pluck(:nickname)
  end
end
