class User < ApplicationRecord
            # Include default devise modules.
            devise :database_authenticatable, :registerable,
                    :recoverable, :rememberable, :trackable, :validatable,
                    :confirmable, :omniauthable
            include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :given_swipes, class_name: "Swipe", foreign_key: "from_user_id", dependent: :destroy
  has_many :received_swipes, class_name: "Swipe", foreign_key: "to_user_id", dependent: :destroy

  has_many :matches_as_user1, class_name: "Match", foreign_key: "user1_id"
  has_many :matches_as_user2, class_name: "Match", foreign_key: "user2_id"

  has_many :messages, dependent: :destroy
  has_one_attached :avatar
  has_many_attached :photos

  def matches
    Match.where("user1_id = ? OR user2_id = ?", self.id, self.id)
  end
end
