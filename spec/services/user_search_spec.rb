require 'rails_helper'

describe UserSearch do
  user = User.create(username: "alexcutschall", oauth_token: "12345")
  subject { UserSearch.new("alexcutschall", user)}

  context "initialize" do
    it "exists with a valid state" do
      expect(subject).to be_a UserSearch
    end
  end
  describe "user" do
    it "finds the users information" do
      user = User.create(username: "alexcutschall", profile_pic: "default_image", followers: 5,
      following: 1, oauth_token: ENV['TEST_TOKEN'], starred: "some url" )

      VCR.use_cassette('/spec/fixtures/cassettes/user_visits_profile') do
        github_user = UserSearch.new("alexcutschall", user).user

        expect(github_user.name).to eq("Alex Cutschall")
        expect(github_user.image).to eq("https://avatars2.githubusercontent.com/u/26206747?v=4")
        expect(github_user.starred_url).to eq("https://api.github.com/users/alexcutschall/starred{/owner}{/repo}")
        expect(github_user.followers).to eq(5)
        expect(github_user.following).to eq(9)
      end
    end
  end
end
