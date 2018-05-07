class User < ApplicationRecord

  def self.from_omniauth(auth_info)
  where(user_id: auth_info[:uid]).first_or_create do |new_user|
    new_user.user_id             = auth_info.uid
    new_user.username            = auth_info.extra.raw_info.name
    new_user.oauth_token         = auth_info.credentials.token
    new_user.oauth_secret_token  = auth_info.credentials.secret
    end
  end
end
