class RecordsController < ApplicationController
  require 'date'
  def done
    @records = Record.all.search(params[:search])
  end
  
  def form1
    session[:memo] = record_params[:memo]
    @record = Record.new
  end
  
  def form2
    @record = Record.new
  end
  
  def show
    @record = Record.find(params[:id])
  end
  
  def create
    @record = Record.new(
                      memo: session[:memo],
                      sun: record_params[:sun]
                      )
    @record.save                  
    flash[:notice] = "登録しました"
    redirect_to done_records_path
  end
  
    private
   
    def record_params
      params.require(:record).permit(:getup_time, :sleep_time, :memo, :sun)
    end
    
    
end
