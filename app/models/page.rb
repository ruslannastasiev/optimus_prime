class Page < ActiveRecord::Base
  attr_accessible :content, :link, :name
  validates_uniqueness_of :link

  def to_param
  	link
  end
end