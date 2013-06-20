require 'spec_helper'

describe "Championships" do
  sign_in :user
  let!(:championship) { create :championship, user: current_user }
  
  describe "listing" do
        
    it "show Championships in list" do
      visit user_path(current_user)
      expect(page).to have_content(championship.name)
    end

  end

  describe "edit championship" do

    it "fill field for edit championship" do
      visit user_path(current_user)
      click_link("Edit")
      fill_in :championship_name, with: "ukraine" 
      click_button "Update Championship"      
      expect(page).to have_content("ukraine")
    end

  end

  describe "create championship" do

    it "fill field for create championship" do
      visit user_path(current_user)
      click_link("New")
      fill_in :championship_name, with: "poland"
      click_button "Create Championship"
      expect(page).to have_content("poland")
    end

  end

  describe "delete championship" do

    it "delete championship by clicking on button" do
      visit user_path(current_user)
      click_link("Delete")
      expect(page).not_to have_content(championship.name)
    end

  end
  
end