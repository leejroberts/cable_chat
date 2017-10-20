class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :chatrooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def name
    email.split("@")[0]
  end

  def timestamp
    created_at.strftime('%H:%M:%S: %d %B %Y')
  end

end
