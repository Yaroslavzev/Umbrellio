# frozen_string_literal: true

class Post <  Sequel::Model
  one_to_many :rates
  many_to_one :user
end
