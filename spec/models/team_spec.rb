require 'spec_helper'

describe Team do
  let(:user) { create :user}
  let(:championship) { create(:championship) }
  let(:team1) { create :team }
  let(:team2) { create :team }  
  let!(:score1) { create :score, team1_id: team1.id, team2_id: team2.id, team1_score: "3", team2_score: "1" }
  let!(:score2) { create :score, team1_id: team1.id, team2_id: team2.id, team1_score: "4", team2_score: "2" }
  let!(:score3) { create :score, team1_id: team1.id, team2_id: team2.id, team1_score: "3", team2_score: "3" }
  let!(:score4) { create :score, team1_id: team2.id, team2_id: team1.id, team1_score: "3", team2_score: "2" }
  let!(:score5) { create :score, team1_id: team2.id, team2_id: team1.id, team1_score: "3", team2_score: "1" }
  let!(:score6) { create :score, team1_id: team2.id, team2_id: team1.id, team1_score: "2", team2_score: "2" }


  it { should validate_presence_of(:name) }  
  it { should ensure_length_of(:name).is_at_most(100) }
  it { should validate_presence_of(:championship) }
  it { should have_many(:team1_scores) }
  it { should have_many(:team2_scores) }

  it "should calculate winnings" do    
    expect(team1.won).to eq(2)
  end

  it "should calculate losses" do    
    expect(team1.lost).to eq(2)
  end

  it "should calculate draws" do    
    expect(team1.drawn).to eq(2)
  end

  it "should calculate goal_for" do    
    expect(team1.goal_for).to eq(15)
  end

  it "should calculate goal_against" do    
    expect(team1.goal_against).to eq(14)
  end

  it "should calculate home_scores" do
    expect(team1.team1_scores.count).to eq(3) 
  end

  it "should calculate guest_scores" do
    expect(team1.team2_scores.count).to eq(3) 
  end
  
end