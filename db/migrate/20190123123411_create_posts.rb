Sequel.migration do
  change do
    create_table :posts do
      primary_key :id
      foreign_key :user_id, :users, null: false

      Text :title
      Text :body
      Inet :ip
      #References :user, foreign_key: true


    end
  end
end
