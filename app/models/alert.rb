class Alert < ActiveRecord::Base

  has_many :vehicles, :dependent => :destroy
  accepts_nested_attributes_for :vehicles

  has_many :victims, :dependent => :destroy
  accepts_nested_attributes_for :victims

  has_many :suspects, :dependent => :destroy
  accepts_nested_attributes_for :suspects



  belongs_to :alert_type

end
