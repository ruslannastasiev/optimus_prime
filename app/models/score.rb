class Score < ActiveRecord::Base
  attr_accessible :team1_score, :team2_score, :team1_id, :team2_id, :team1, :team2

  belongs_to :team1, class_name: 'Team', foreign_key: :team1_id
  belongs_to :team2, class_name: 'Team', foreign_key: :team2_id

end