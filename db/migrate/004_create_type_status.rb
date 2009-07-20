class CreateTypeStatus < ActiveRecord::Migration
  def self.up
    create_table :type_status do |t|
      t.column :description, :string, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :type_status
  end
end
