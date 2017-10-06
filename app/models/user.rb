class User < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_many :conversations_as_sender, class_name: "Conversation", foreign_key: :sender_id, dependent: :destroy
  has_many :conversations_as_recipient, class_name: "Conversation", foreign_key: :recipient_id, dependent: :destroy
  has_many :messages_as_author, class_name: "Message", foreign_key: :author_id, dependent: :destroy
  validates_presence_of :name, :birthday
  
  devise :database_authenticatable, :registerable,:recoverable, 
  :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  private

  def conversations
    conversations = (conversations_as_sender + conversations_as_recipient)
    conversations.sort_by(&:updated_at)
  end
end