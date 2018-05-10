require 'rails_helper'

describe FollowerEventSearch do
  describe "instance methods" do
    context "it can find the followers event summary" do
      it "shows followers event summary" do
        user = User.create(username: "alexcutschall", profile_pic: "default_image", followers: 5,
        following: 1, oauth_token: ENV['TEST_TOKEN'], starred: "some url" )
        VCR.use_cassette("/spec/fixtures/cassettes/follower_event_searches") do
          follower_events = FollowerEventSearch.new("alexcutschall", user).events
          follower = follower_events.first

          expect(follower_events.count).to eq(30)
          expect(follower.type).to eq("WatchEvent")
          expect(follower.display_login).to eq("jamesrnelson")
          expect(follower.repo_name).to eq("jamesrnelson/apicurious")
          expect(follower.date).to eq("2018-05-10T12:45:18Z")
        end
      end
    end
  end
end
