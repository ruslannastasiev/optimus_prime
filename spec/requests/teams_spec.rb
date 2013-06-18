require 'spec_helper'

describe "Teams" do
  
  let(:championship) { create :championship, teams: [team] }    
  let(:team) { create :team, name: "chelsea" }

  describe "listing teams" do      
    
    it "display teams" do      
      visit championship_path(championship)
      expect(page).to have_content(team.name)
    end

  end

  describe "add team" do
    
    it "add team" do      
      visit new_championship_team_path(championship)
      fill_in :team_name, with: "chelsea"
      click_button "Submit"
      expect(page).to have_content("chelsea")
      expect(page).to have_content(championship.name)
    end

  end

  describe "edit team" do    

    it "fill fieds to edit team" do      
      visit edit_championship_team_path(championship, team)
      fill_in :team_name, with: "chelsea"
      click_button "Submit"
      expect(page).to have_content("chelsea")      
    end
    
  end

end