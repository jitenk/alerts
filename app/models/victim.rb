class Victim < Person

  before_save :set_type

  belongs_to :alert

  def set_type
    self.type = 'victim'
  end

end
