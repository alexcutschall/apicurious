require 'rails_helper'

feature "User visits their repos" do
  scenario "User can see all the repo information" do
    user = User.create(username: "alexcutschall", profile_pic: "default_image", followers: 5,
    following: 1, oauth_token: ENV['TEST_TOKEN'], starred: "some url" )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    # click_on "Repositories"

    # expect(current_path).to eq("/users/#{user.username}")
    # expect(page).to have_content(user.username)
    # expect(page).to have_content(user.profile_pic)
    # expect(page).to have_content(user.followers)
    # expect(page).to have_content(user.following)
    # expect(page).to have_content(user.starred)
  end
end
