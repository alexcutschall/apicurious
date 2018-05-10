require 'rails_helper'

describe RepositorySearch do
  describe "instance methods" do
    context "#repositories" do
      it "shows all of your repositories" do
        user = User.create(username: "alexcutschall", profile_pic: "default_image", followers: 5,
        following: 1, oauth_token: ENV['TEST_TOKEN'], starred: "some url" )
        VCR.use_cassette("repository_search") do
          repositories = RepositorySearch.new(user).repositories
          repository = repositories.first

          expect(repositories.count).to eq(30)
          expect(repository.name).to eq("2win_playlist")
          expect(repository.url).to eq("https://github.com/alexcutschall/2win_playlist")
        end
      end
    end
  end
end
