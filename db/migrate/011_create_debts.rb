class CreateDebts < ActiveRecord::Migration
  def self.up
    create_table :debts do |t|
      t.column :account,       :string,   :null => false
      t.column :contract,      :string,   :null => false
      t.column :date,          :datetime, :null => false
      t.column :amount,        :float,    :null => false
      t.column :date_att,      :datetime, :null => false
      t.column :amount_att,    :string,   :null => false
      t.column :amount_import, :float,    :null => false
      t.column :date_exit,     :datetime
      t.column :reason,        :string
      t.column :secure,        :integer,  :null => false
      t.column :secure_status, :integer,  :null => false
      
      t.column :debtor_id,   :integer
      t.column :branch_id,   :integer
      t.column :modality_id, :integer
      t.column :user_id,     :integer, :default => 1
      t.column :status_id,   :integer, :default => 200

      t.timestamps
    end
#Chaves Estrangeiras
      execute "ALTER TABLE debts ADD CONSTRAINT fk_debts_debtors FOREIGN KEY (debtor_id) REFERENCES debtors(id)"

      execute "ALTER TABLE debts ADD CONSTRAINT fk_debts_users FOREIGN KEY (user_id) REFERENCES users(id)"

      execute "ALTER TABLE debts ADD CONSTRAINT fk_debts_branches FOREIGN KEY (branch_id) REFERENCES branches(id)"

      execute "ALTER TABLE debts ADD CONSTRAINT fk_debts_modalities FOREIGN KEY (modality_id) REFERENCES modalities(id)"

      execute "ALTER TABLE debts ADD CONSTRAINT fk_debts_status FOREIGN KEY (status_id) REFERENCES status(id)"
  end

  def self.down
    drop_table :debts
  end
end
