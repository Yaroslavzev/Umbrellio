class Post <  Sequel::Model #ApplicationRecord
  #validates :title, :body, presence: true
  one_to_many :rates#, key: post_id
  many_to_one :user#, key: user_id
end
