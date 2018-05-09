Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['CLIENT_ID'], ENV['GITHUB_SECRET_KEY'], scope: "user,repo,organizations,read:org"
end
