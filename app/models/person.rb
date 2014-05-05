class Person < ActiveRecord::Base
  belongs_to :alert

  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true


  GENDER = ['Male','Female','Unknown']
  HAIR_COLOR = ['Bald', 'Black', 'Blonde', 'Brown', 'Gray', 'Red or Auburn', 'Green', 'Multicolored', 'Orange', 'Pink', 'Purple', 'Sandy', 'White', 'Unknown']
  EYE_COLOR = ['Black', 'Blue', 'Brown', 'Green', 'Hazel', 'Gray', 'Maroon', 'Multicolored', 'Pink', 'Unknown']
  RACE = ['American Indian', 'Alaskan Native', 'Asian or Pacific Islander', 'Black', 'White', 'Hispanic', 'Unknown']
  AGE_UNIT = ['Day(s)', 'Week(s)', 'Month(s)', 'Year(s)']

  def full_name
    "#{self.first_name} #{self.last_name}" rescue nil
  end

  # private
  # def attributes_protected_by_default
  #   super - [self.class.inheritance_column]
  # end

end
