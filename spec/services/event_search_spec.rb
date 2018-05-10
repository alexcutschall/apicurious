require 'rails_helper'

describe EventSearch do
  user = User.create(username: "alexcutschall", profile_pic: "default_image", followers: 5,
  following: 1, oauth_token: ENV['TEST_TOKEN'], starred: "some url" )
  subject { EventSearch.new("alexcutschall", user)}

  context "initialize" do
    it "exists with a valid state" do
      expect(subject).to be_a EventSearch
    end
  end
  describe "events" do
    it "finds all the personal events" do
      user = User.create(username: "alexcutschall", profile_pic: "default_image", followers: 5,
      following: 1, oauth_token: ENV['TEST_TOKEN'], starred: "some url" )

      VCR.use_cassette("services/find_all_personal_events") do
        events = EventSearch.new("alexcutschall", user).events
        event = events.first

        expect(events.count).to eq(30)
        expect(event.type).to eq("IssuesEvent")
        expect(event.display_login).to eq("alexcutschall")
        expect(event.repo_name).to eq("alexcutschall/apicurious")
      end
    end
  end
end
