class DebtorsController < ApplicationController
  def index
    @debtors = Debtor.find :all, 
                           :conditions => ["user_id = ? and (updated_at is null or Date_Format(updated_at, '%Y-%m-%d') <> ?)", session[:id], DateTime::now().strftime("%Y-%m-%d")]

  end

  def show
    @debtor = Debtor.find params[:id]
  end

  def update
    @debtor = Debtor.find params[:id]
    @debtor.attributes = params[:debtor]
  
    @debts = Debt.find_by_sql("select debts.* from debts inner join status on status_id = status.id inner join type_status on type_status.id = status.type_status_id where debts.debtor_id = #{@debtor.id} and type_status.id not in (1,6)")
    
    for element in @debts
      element.status_id = 300
      element.save
    end

    if @debtor.save
      flash[:notice] = "Status alterado com sucesso!"    
    else
      flash[:notice] = "Oops! Temos um probleminha.."
    end

    redirect_to debtor_path(@debtor)
  end
end
