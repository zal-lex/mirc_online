class OnlineService
  def initialize(user:)
    @user = user
  end

  def make_online!
    @user.update(online: true)
    broadcast_users
  end

  def make_offline!
    @user.update(online: false)
    broadcast_users
  end

  private

  def broadcast_users
    ActionCable.server.broadcast("online_channel", users: User.online.pluck(:nickname))
  end
end
