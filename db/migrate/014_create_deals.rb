class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.column :date,           :datetime, :null => false
      t.column :debt_count,    :integer,  :null => false
      t.column :plot_count,    :integer,  :null => false
      t.column :plot_number,   :integer,  :null => false
      t.column :plot_date,     :datetime, :null => false
      t.column :plot_amount,   :float,    :null => false
      t.column :description,    :string
      t.column :payment_date,   :datetime
      t.column :payment_amount, :float
      t.column :iof_amount,     :float,    :null => false

      t.column :debtor_id,    :integer
      t.column :debt_id,      :integer
      t.column :type_deal_id, :integer
    end
#Chaves Estrangeiras
      execute "ALTER TABLE deals ADD CONSTRAINT fk_deals_debtors FOREIGN KEY (debtor_id) REFERENCES debtors(id)"

      execute "ALTER TABLE deals ADD CONSTRAINT fk_deals_debts FOREIGN KEY (debt_id) REFERENCES debts(id)"

      execute "ALTER TABLE deals ADD CONSTRAINT fk_deals_type_deals FOREIGN KEY (type_deal_id) REFERENCES type_deals(id)"

  end

  def self.down
    drop_table :deals
  end
end

