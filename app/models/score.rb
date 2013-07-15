class Score < ActiveRecord::Base
  attr_accessible :team1_score, :team2_score, :team1_id, :team2_id, :team1, :team2, :season_id, :round

  belongs_to :team1, class_name: 'Team', foreign_key: :team1_id
  belongs_to :team2, class_name: 'Team', foreign_key: :team2_id
  belongs_to :season

  def self.reject_nil_scores
    scoped.to_a.reject { |i| (i.team1_score == nil) || (i.team2_score == nil) }
  end

end