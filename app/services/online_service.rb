class OnlineService
  def initialize(user:)
    @user = user
  end

  def make_online!
    @user.update(online: true)
  end

  def make_offline!
    @user.update(online: false)
  end
end
