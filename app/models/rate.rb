class Rate < Sequel::Model #ApplicationRecord
  many_to_one :post#, key: post_id
end
