class OnlineChannel < ApplicationCable::Channel
  def subscribed
    stream_from "online_channel"
    OnlineService.new(user: current_user).make_online!
  end

  def unsubscribed
    OnlineService.new(user: current_user).make_offline!
  end
end
