class User < ActiveRecord::Base
  has_many :events, dependent: :destroy
  validates_presence_of :name, :birthday

  devise :database_authenticatable, :registerable,:recoverable, 
  :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end
