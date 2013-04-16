class Team < ActiveRecord::Base
  attr_accessible :name

  belongs_to :championship
  has_many :team1_scores, class_name: 'Score', foreign_key: :team1_id
  has_many :team2_scores, class_name: 'Score', foreign_key: :team2_id

  validates :name, presence: true, length: { maximum: 100 }
  validates :championship_id, presence: true

end