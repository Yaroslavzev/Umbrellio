# frozen_string_literal: true

class Rate < Sequel::Model
  many_to_one :post
end
