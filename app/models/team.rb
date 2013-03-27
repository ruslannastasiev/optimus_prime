class Team < ActiveRecord::Base
  attr_accessible :name

  belongs_to :championship
  validates :name, presence: true, length: { maximum: 100 }
  validates :championship_id, presence: true

end
