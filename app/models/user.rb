class User < ActiveRecord::Base
  belongs_to :cat

  def self.from_omniauth(auth)
    where(uid: auth[:uid]).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    end
  end
end
