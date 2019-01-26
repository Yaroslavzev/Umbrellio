class User < Sequel::Model#ApplicationRecord
  one_to_many :posts#, :eager=>[:tags]#, key: id
end
