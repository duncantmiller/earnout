class User < ActiveRecord::Base
  include Permissible
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :send_welcome_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :permissions

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

end
