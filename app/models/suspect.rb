class Suspect < Person

  belongs_to :alert

  def type=(type)
    write_attribute(:type, 'suspect')
  end

end
