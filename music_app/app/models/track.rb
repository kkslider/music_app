class Track < ActiveRecord::Base
  attr_accessible :name, :album_id
  validates :name, :album_id, presence: true
  
  belongs_to(
  :album,
  :class_name => "Album",
  :foreign_key => :album_id,
  :primary_key => :id
  )
  
  has_one(
  :band,
  :through => :album,
  :source => :band
  )
  
  
end