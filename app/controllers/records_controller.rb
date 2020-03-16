class RecordsController < ApplicationController
  require 'date'
  before_action :authenticate_user!
  def done
    @records = Record.where(user_id: current_user.id).all.search(params[:search])
  end
    
  def form1
    @record = Record.new(user_id: current_user.id)
  end
  def form3
    session[:memo] = record_params[:memo]
    @record = Record.new(user_id: current_user.id)
  end
  def form4
    session[:memo] = record_params[:memo]
    @record = Record.new(user_id: current_user.id)
  end
  def form2
    session[:memo] = record_params[:memo]
    @record = Record.new(user_id: current_user.id)
  end

  def show
    @record = Record.find(params[:id])
  end
  
  def create
    
    @record = Record.new(
                      memo: session[:memo],
                      sun: record_params[:sun],
                      user_id: session[:user_id]
                      )
    @record.user_id = current_user.id                  
    @record.save                  
    flash[:notice] = "登録しました"
    redirect_to done_records_path
  end
  
    private
   
    def record_params
      params.require(:record).permit(:getup_time, :sleep_time, :memo, :sun, :user_id)
    end
    
    
end
