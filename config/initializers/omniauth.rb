Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "25a708e1b2c75fa28224", "32acb2e29484ec98e5e8ffa8cde9418a00a46fc5"
end
