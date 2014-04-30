class Victim < Person
  before_save :set_type

  belongs_to :alert

  def set_type
    self.type = type
  end

  def full_name
    "#{self.first_name} #{self.last_name}" rescue nil
  end

end
