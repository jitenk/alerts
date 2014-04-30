class Person < ActiveRecord::Base
  belongs_to :alert

  #self.inheritance_column = :type

  def full_name
    "#{self.first_name} #{self.last_name}" rescue nil
  end

  # private
  # def attributes_protected_by_default
  #   super - [self.class.inheritance_column]
  # end

end
