require 'spec_helper'

describe "Scores" do
  sign_in :user

  let(:championship) { create :championship, teams: [team1, team2, team3, team4] }  
  let!(:team1) { create :team, name: "chelsea" }
  let!(:team2) { create :team, name: "arsenal" }
  let!(:team3) { create :team, name: "man-un" }
  let!(:team4) { create :team, name: "man-city"}  

  describe "add score" do   

    it "add score" do
      visit championship_path(championship)
      fill_in "#{team1.id}-#{team2.id}-home", with: '3'
      fill_in "#{team2.id}-#{team1.id}-guest", with: '2'
      click_button "#{team1.id}-#{team2.id}-home-#{team2.id}-#{team1.id}-guest"
      expect(page).to have_content("3")
      expect(page).to have_content("2")
    end  
    
  end

  describe "edit score" do  

    it "edit score" do
      visit championship_path(championship)
      fill_in "#{team1.id}-#{team2.id}-home", with: '5'
      fill_in "#{team2.id}-#{team1.id}-guest", with: '9'
      click_button "#{team1.id}-#{team2.id}-home-#{team2.id}-#{team1.id}-guest"
      expect(page).to have_content("5")
      expect(page).to have_content("9")
    end

  end

  describe "listing scores" do
    
    it "listing combinated scores in seasons" do
      visit new_championship_season_path(championship)
      fill_in "season_start_date", with: "2013"
      click_button "Submit"
      expect(page).to have_button("#{team1.id}-#{team2.id}-home-#{team2.id}-#{team1.id}-guest")
      expect(page).to have_button("#{team1.id}-#{team3.id}-home-#{team3.id}-#{team1.id}-guest")
      expect(page).to have_button("#{team1.id}-#{team4.id}-home-#{team4.id}-#{team1.id}-guest")
      expect(page).to have_button("#{team2.id}-#{team1.id}-home-#{team1.id}-#{team2.id}-guest")
      expect(page).to have_button("#{team2.id}-#{team3.id}-home-#{team3.id}-#{team2.id}-guest")
      expect(page).to have_button("#{team2.id}-#{team4.id}-home-#{team4.id}-#{team2.id}-guest")
      expect(page).to have_button("#{team3.id}-#{team1.id}-home-#{team1.id}-#{team3.id}-guest")
      expect(page).to have_button("#{team3.id}-#{team2.id}-home-#{team2.id}-#{team3.id}-guest")
      expect(page).to have_button("#{team3.id}-#{team4.id}-home-#{team4.id}-#{team3.id}-guest")
      expect(page).to have_button("#{team4.id}-#{team1.id}-home-#{team1.id}-#{team4.id}-guest")
      expect(page).to have_button("#{team4.id}-#{team2.id}-home-#{team2.id}-#{team4.id}-guest")
      expect(page).to have_button("#{team4.id}-#{team3.id}-home-#{team3.id}-#{team4.id}-guest")       
    end

  end

end