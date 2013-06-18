require 'spec_helper'

describe "Scores" do
  sign_in :user

  let(:championship) { create :championship, teams: [team1, team2] }
  let(:team1) { create :team, name: "chelsea" }
  let(:team2) { create :team, name: "arsenal" }

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

end