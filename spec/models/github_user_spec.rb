require 'spec_helper'
require './app/models/github_user'

describe GithubUser do
  let(:attributes) {
    {
      name: "Alex",
      avatar_url: "Image URL",
      starred_url: "Starred URL",
      followers: 6,
      following: 18
    }
  }
  subject{GithubUser.new(attributes)}
  context "initialize" do
    it "exists with attributes" do
      expect(subject).to be_a GithubUser
      expect(subject.name).to eq("Alex")
      expect(subject.image).to eq("Image URL")
      expect(subject.starred_url).to eq("Starred URL")
      expect(subject.followers).to eq(6)
      expect(subject.following).to eq(18)
    end
  end
end
