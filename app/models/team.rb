class Team < ActiveRecord::Base
  attr_accessible :name
  attr_reader :won, :lost, :drawn

  belongs_to :championship
  has_many :team1_scores, class_name: 'Score', foreign_key: :team1_id
  has_many :team2_scores, class_name: 'Score', foreign_key: :team2_id

  validates :name, presence: true, length: { maximum: 100 }
  validates :championship_id, presence: true


  def goal_for
    team1_scores.sum(&:team1_score) + team2_scores.sum(&:team2_score)     
  end

  def goal_against
    team1_scores.sum(&:team2_score) + team2_scores.sum(&:team1_score)        
  end
  
end