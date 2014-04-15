class Victim < Person

  belongs_to :alert

  def type=(type)
    write_attribute(:type, 'victim')
  end
end
