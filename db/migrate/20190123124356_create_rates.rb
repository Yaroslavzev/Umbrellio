# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :rates do
      primary_key :id
      foreign_key :post_id, :posts, null: false

      Integer :value
    end
  end
end
