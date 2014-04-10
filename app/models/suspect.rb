class Suspect < Person

  def type=(type)
    write_attribute(:type, 'suspect')
  end

end
