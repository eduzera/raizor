class Debtor < ActiveRecord::Base
  has_many   :debt        #Divida
  has_many   :phone       #Telefone
  has_many   :before_deal #Situação do Acordo
  belongs_to :user        #Usuário
  belongs_to :status      #Status
  
  # Dados da Tabela
  validates_presence_of :name
  validates_presence_of :controller
  validates_presence_of :debtor_type
  validates_presence_of :cpf_cnpj

  validates_uniqueness_of :controller  
  validates_uniqueness_of :cpf_cnpj
end
