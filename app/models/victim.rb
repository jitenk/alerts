class Victim < Person

  def type=(type)
    write_attribute(:type, 'victim')
  end
end
