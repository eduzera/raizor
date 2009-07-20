class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :name,     :string, :null => false
      t.column :login,    :string, :null => false
      t.column :password, :string, :null => false, :default => "emplaca09"
      t.column :active,   :boolean, :null => false, :default => true

      t.column :profile_id, :integer,  :null => :false     

      t.timestamps
    end
#Chaves Estrangeiras
      execute "ALTER TABLE users ADD CONSTRAINT fk_users_profiles FOREIGN KEY (profile_id) REFERENCES profiles(id)"
  end

  def self.down
    drop_table :users
  end
end
