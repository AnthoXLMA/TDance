class Swipe < ApplicationRecord
  belongs_to :from_user, class_name: "User"
  belongs_to :to_user, class_name: "User"

  after_create :check_for_match

  def check_for_match
    if like && Swipe.exists?(from_user: to_user, to_user: from_user, like: true)
      Match.create(user1: from_user, user2: to_user)
    end
  end
end
