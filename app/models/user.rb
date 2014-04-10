class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :agency_ori, :address1, :city, :state, :zip, :phone, :presence => true

  #validate :password_complexity
  #
  #def password_complexity
  #  if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d). /)
  #    errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
  #  end
  #end

  def full_name
    if self.first_name && self.last_name
      "#{self.first_name} #{self.last_name}"
    elsif self.first_name.present?
      "#{self.first_name}"
    elsif self.last_name.present?
      "#{self.last_name}"
    else
      "No Name"
    end
  end

end
