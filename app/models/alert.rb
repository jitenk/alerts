class Alert < ActiveRecord::Base

  has_many :vehicles, :dependent => :destroy
  accepts_nested_attributes_for :vehicles,
                                :allow_destroy => true#,
                                #:reject_if => lambda {|a| a[:full_name].blank?}

  has_many :victims, :dependent => :destroy
  accepts_nested_attributes_for :victims,
                                :allow_destroy => true#,
                                #:reject_if => lambda {|a| a[:full_name].blank?}

  has_many :suspects, :dependent => :destroy
  accepts_nested_attributes_for :suspects,
                                :allow_destroy => true#,
                                #:reject_if => lambda {|a| a[:full_name].blank?}

  belongs_to :alert_type

  def victims_names
    self.victims.collect(&:full_name).join(', ')
  end

  def suspects_names
    self.suspects.collect(&:full_name).join(', ')
  end

end
