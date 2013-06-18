require 'spec_helper'

describe "Microposts" do
  sign_in :user
  let!(:micropost) { create :micropost, user: current_user }

  describe "listing" do

    it "show Microposts in list" do
      visit root_path
      expect(page).to have_content(current_user.email)
      expect(page).to have_content(micropost.content)
      expect(page).to have_content("Posted #{time_ago_in_words(micropost.created_at)}")
    end

  end

  describe "create micropost" do

    it "fill field to create micropost" do
      visit root_path
      fill_in :micropost_content, with: "my post"
      click_button("Submit")
      expect(page).to have_content(current_user.email)
      expect(page).to have_content("my post")
      expect(page).to have_content("Posted #{time_ago_in_words(micropost.created_at)}")
    end

  end

  describe "delete micropost" do

    it "delete micropost by clicking on button" do
      visit root_path
      click_link("delete")
      expect(page).not_to have_content(micropost.content)
    end

  end

end