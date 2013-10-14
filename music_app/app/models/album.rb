class Album < ActiveRecord::Base
  attr_accessible :name, :band_id
  validates :name, :band_id, presence: true
  
  belongs_to(
  :band,
  :class_name => "Band",
  :foreign_key => :band_id,
  :primary_key => :id
  )
  
  has_many(
  :tracks,
  :class_name => "Track",
  :foreign_key => :album_id,
  :primary_key => :id,
  :dependent => :destroy
  )
  
end
