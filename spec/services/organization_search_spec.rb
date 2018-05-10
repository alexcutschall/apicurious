require 'rails_helper'

describe OrganizationSearch do
  describe "instance methods" do
    context "#organizations" do
      it "shows all organizations you belong to" do
        user = User.create(username: "alexcutschall", profile_pic: "default_image", followers: 5,
        following: 1, oauth_token: ENV['TEST_TOKEN'], starred: "some url" )

        VCR.use_cassette("/spec/fixtures/cassettes/organization_search") do
          organizations = OrganizationSearch.new(user).organizations
          organization = organizations.first

          expect(organizations.count).to eq(1)
          expect(organization.login).to eq("TestingforAPI")
          expect(organization.url).to eq("https://api.github.com/orgs/TestingforAPI")
          expect(organization.avatar_url).to eq("https://avatars0.githubusercontent.com/u/39129580?v=4")
        end
      end
    end
  end
end
