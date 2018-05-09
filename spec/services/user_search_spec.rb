require 'rails_helper'

describe UserSearch do
  user = User.create(username: "alexcutschall", oauth_token: "12345")
  subject { UserSearch.new("alexcutschall", user)}

  context "initialize" do
    it "exists with a valid state" do
      expect(subject).to be_a UserSearch
    end
  end

  # context "instance methods" do
  #   context "#members" do
  #     it "returns a collection of members" do
  #       expect(subject.members.count).to eq(7)
  #       expect(subject.members.first).to be_a Member
  #     end
  #   end
  # end
end
