require 'spec_helper'
require './app/models/event'

describe Event do
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
      payload:
      {
      commits:
      [message: "refactoring"],
      pull_request:
      {title: "pulling into master"}
      }
    }
  }
  subject{Event.new(attributes)}
  context "initialize" do
    it "exists with attributes" do
      expect(subject).to be_a Event
      expect(subject.type).to eq("PullRequest")
      expect(subject.display_login).to eq("alexcutschall")
      expect(subject.repo_name).to eq("apicurious")
      expect(subject.commit_name).to eq("refactoring")
      expect(subject.pull_request_name).to eq("pulling into master")
    end
  end
end
