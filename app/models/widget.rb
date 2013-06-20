class Widget < ActiveRecord::Base
  attr_accessible :content, :name, :page_id

  belongs_to :page
  
  validates :name, presence:   true,
                   length:     { maximum: 30 },
                   uniqueness: { case_sensitive: false }
  validates :content, presence: true
  validates :page, presence: true

end
