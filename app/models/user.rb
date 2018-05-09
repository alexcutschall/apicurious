class User < ApplicationRecord

  def self.from_omniauth(auth_info)
    where(user_id: auth_info[:uid]).first_or_create do |new_user|
      new_user.user_id             = auth_info.uid
      new_user.profile_pic         = auth_info.image
      new_user.username            = auth_info.extra.raw_info.name
      new_user.followers           = auth_info.extra.raw_info.followers
      new_user.following           = auth_info.extra.raw_info.following
      new_user.starred             = auth_info.extra.raw_info.starred_url
      new_user.oauth_token         = auth_info.credentials.token
      new_user.oauth_secret_token  = auth_info.credentials.secret_token
      end
  end
end
