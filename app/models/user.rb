class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_admin_mail

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


  def active_for_authentication?
    super && approved?
  end

  #Error message are in config/locales/devise.en.yml
  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  def send_admin_mail
    #AdminMailer.new_user_waiting_for_approval(self).deliver
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end

end
