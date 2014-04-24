class Person < ActiveRecord::Base
  belongs_to :alert

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private
  def attributes_protected_by_default
    super - [self.class.inheritance_column]
  end
end
