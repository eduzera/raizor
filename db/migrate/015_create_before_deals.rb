class CreateBeforeDeals < ActiveRecord::Migration
  def self.up
    create_table :before_deals do |t|
      t.column :date, :datetime,         :null => false
      t.column :plot_number,  :integer,  :null => false
      t.column :plot_date,    :datetime, :null => false
      t.column :plot_first,   :float,    :null => false
      t.column :plot_amount,  :float,    :null => false
      t.column :iof_amount,   :float,    :null => false
      t.column :debtor_email, :string

      t.column :debtor_id,    :integer
      t.column :debt_id,      :integer
      t.column :type_deal_id, :integer
    end
#Chaves Estrangeiras
      execute "ALTER TABLE before_deals ADD CONSTRAINT fk_before_deals_debtors FOREIGN KEY (debtor_id) REFERENCES debtors(id)"

      execute "ALTER TABLE before_deals ADD CONSTRAINT fk_before_deals_debts FOREIGN KEY (debt_id) REFERENCES debts(id)"

      execute "ALTER TABLE before_deals ADD CONSTRAINT fk_before_deals_type_deals FOREIGN KEY (type_deal_id) REFERENCES deals(id)"
  end

  def self.down
    drop_table :before_deals
  end
end
