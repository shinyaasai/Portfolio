class RecordsController < ApplicationController
  require 'date'
  def index
    @records = Record.all.search(params[:search])
  end
  
  def new
    @record = Record.new
  end
  
  def show
    @record = Record.find(params[:id])
  end
  
  def create
    @record = Record.create(record_params)
    flash[:notice] = "登録しました"
    redirect_to records_path 
  end
  
    private
   
    def record_params
      params.require(:record).permit(:getup_time, :sleep_time, :awakening, :medicine, :sun, :memo)
    end
    
    
end
