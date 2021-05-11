class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar,dependent: :destroy
  validate :validate_user
  attr_writer :login

  def login
    @login || self.user || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(user) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:user) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def validate_user
    if User.where(email: user).exists?
      errors.add(:user, :invalid)
    end
  end
end
