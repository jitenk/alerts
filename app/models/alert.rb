class Alert < ActiveRecord::Base
  has_many :persons
  belongs_to :alert_type
end
