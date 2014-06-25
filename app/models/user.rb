class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # email以外で認証する場合に必要
  def email_required?
    false
  end

  def active_for_authentication?
    super && service_time?
  end

  # サービス時間内か
  def service_time?
    now = Time.now
    if now.hour >= Settings.service_start_time &&
      now.hour < Settings.service_end_time
      return true
    end
    false
  end

  def inactive_message
    service_time? ? super : :not_service_time
  end
end
