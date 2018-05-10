require 'rails_helper'

feature "User visits their profile" do
  scenario "User clicks on their profile" do
    user = User.create(username: "alexcutschall", profile_pic: "default_image", followers: 5,
    following: 1, oauth_token: ENV['TEST_TOKEN'], starred: "some url" )

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/"
    click_on "Profile"

    # expect(current_path).to eq("/users/#{user.username}")
    # expect(page).to have_content(user.username)
    # expect(page).to have_content(user.profile_pic)
    # expect(page).to have_content(user.followers)
    # expect(page).to have_content(user.following)
    # expect(page).to have_content(user.starred)
    # expect(page).to have_content(events)
    # expect(page).to have_content(recieved_events)
  end
end
