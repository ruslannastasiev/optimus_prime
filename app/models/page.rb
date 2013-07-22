class Page < ActiveRecord::Base
  attr_accessible :content, :link, :name

  has_many :widgets, dependent: :destroy

  validates :content, presence: true
  validates :link, presence: true,
                   length:   { maximum: 30 },
                   uniqueness: { case_sensitive: false }
  validates :name, presence: true,
                   length:   { maximum: 30 }

  def to_param
  	link
  end
end