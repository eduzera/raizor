class CreateDebtLogs < ActiveRecord::Migration
  def self.up
    create_table :debt_logs do |t|
      t.column :status_id, :integer
      t.column :user_id,   :integer

      t.timestamps
    end
#Chaves Estrangeiras
      execute "ALTER TABLE debt_logs ADD CONSTRAINT fk_debt_logs_status FOREIGN KEY (status_id) REFERENCES status(id)"

      execute "ALTER TABLE debtor_logs ADD CONSTRAINT fk_debt_logs_users FOREIGN KEY (user_id) REFERENCES users(id)"
  end

  def self.down
    drop_table :debt_logs
  end
end
