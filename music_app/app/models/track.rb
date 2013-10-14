class Track < ActiveRecord::Base
  attr_accessible :name, :album_id, :version, :lyrics
  validates :name, :album_id, :version, :lyrics, presence: true
  validates :version, inclusion: { in: %w[regular bonus ]}
  
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
  
  has_many(
  :notes,
  :class_name => "Note",
  :foreign_key => :track_id,
  :primary_key => :id
  )
  
  
end