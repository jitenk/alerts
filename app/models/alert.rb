class Alert < ActiveRecord::Base
  has_many :victims
  accepts_nested_attributes_for :victims,
                                :allow_destroy => true,
                                :reject_if => lambda {|a| a[:full_name].blank?}
  belongs_to :alert_type
end
