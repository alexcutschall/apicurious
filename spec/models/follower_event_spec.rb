require 'spec_helper'
require './app/models/follower_event'

describe FollowerEvent do
  let(:attributes) {
    {
      type: "PullRequest",
      actor:
      {
        display_login: "alexcutschall"
      },
      repo:
      {
        name: "apicurious"
      },
      created_at: "2018-12-12"
    }
  }
  subject{ FollowerEvent.new(attributes) }
  context "initialize" do
    it "exists with attributes" do
      expect(subject).to be_a FollowerEvent
      expect(subject.type).to eq("PullRequest")
      expect(subject.display_login).to eq("alexcutschall")
      expect(subject.repo_name).to eq("apicurious")
      expect(subject.date).to eq("2018-12-12")
    end
  end
end
