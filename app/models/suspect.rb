class Suspect < Person
  before_save :set_type

  belongs_to :alert

  def set_type
    self.type = 'Suspect'
  end

end
