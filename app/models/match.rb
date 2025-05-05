class Match < ApplicationRecord
  belongs_to :user1
  belongs_to :user2

  # app/models/match.rb
def involves?(user)
  user1 == user || user2 == user
end

end
