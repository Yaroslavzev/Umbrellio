Sequel.migration do
  change do
    create_table :rates do
      primary_key :id
      foreign_key :post_id, :posts, null: false

      Integer :value
      #References :post, foreign_key: true

      #Timestamps
    end
  end
end
