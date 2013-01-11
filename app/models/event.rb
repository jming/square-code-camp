class Event < ActiveRecord::Base
  #attr_accessible :event_name, :date, :start_time, :end_time, :address, :details  # :as => :admin 

  belongs_to :creator, :class_name => "User"
  has_many :event_attendees
  has_many :attendees, :through => :event_attendees, :source => :user

  def created_by?(user)
    creator == user
  end
end
