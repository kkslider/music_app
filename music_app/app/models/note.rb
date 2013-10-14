class Note < ActiveRecord::Base
  attr_accessible :user_id, :track_id, :content
  validates :user_id, :track_id, :content, presence: true
  validates :user_id, :track_id, numericality: { only_integer: true }
  
  belongs_to(
  :user,
  :class_name => "User",
  :foreign_key => :user_id,
  :primary_key => :id
  )
  
  belongs_to(
  :track,
  :class_name => "Track",
  :foreign_key => :track_id,
  :primary_key => :id
  )
end
