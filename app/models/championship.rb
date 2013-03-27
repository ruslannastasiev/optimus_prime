class Championship < ActiveRecord::Base
  attr_accessible :name

  belongs_to :user
  has_many :teams, dependent: :destroy
  validates :name, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true

end
