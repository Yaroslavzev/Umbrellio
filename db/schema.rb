Sequel.migration do
  change do
    create_table(:schema_migrations) do
      column :filename, "text", :null=>false
      
      primary_key [:filename]
    end
    
    create_table(:users) do
      primary_key :id
      column :login, "text"
    end
    
    create_table(:posts) do
      primary_key :id
      foreign_key :user_id, :users, :null=>false, :key=>[:id]
      column :title, "text"
      column :body, "text"
      column :ip, "inet"
    end
    
    create_table(:rates) do
      primary_key :id
      foreign_key :post_id, :posts, :null=>false, :key=>[:id]
      column :value, "integer"
    end
  end
end
              Sequel.migration do
                change do
                  self << "SET search_path TO \"$user\", public"
                  self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20190123123400_create_users.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20190123123411_create_posts.rb')"
self << "INSERT INTO \"schema_migrations\" (\"filename\") VALUES ('20190123124356_create_rates.rb')"
                end
              end
