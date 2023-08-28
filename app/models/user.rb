class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status: [:Service_provider ,:Guest ]

  has_many :appointments, dependent: :destroy
  
  has_one_attached :main_image
  after_create :welcome_send
  
  
  def welcome_send 
    UserMailer.welcome_send(self).deliver_now
  end

 
end

