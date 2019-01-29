# frozen_string_literal: true

Sequel.migration do
  change do
    create_table :posts do
      primary_key :id
      foreign_key :user_id, :users, null: false

      Text :title
      Text :body
      Inet :ip
    end
  end
end
