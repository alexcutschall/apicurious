require 'rails_helper'

describe EventSearch do
  user = User.create(username: "alexcutschall", oauth_token: "12345")
  subject { EventSearch.new("alexcutschall", user)}

  context "initialize" do
    it "exists with a valid state" do
      expect(subject).to be_a EventSearch
    end
  end
end
