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
    session[:getout] = record_params[:getout]
    session[:sun] = record_params[:sun]
    @record = Record.new(user_id: current_user.id)
  end
  def form4
    session[:sleepiness] = record_params[:sleepiness]
    @record = Record.new(user_id: current_user.id)
  end
  def form2
    session[:memo] = record_params[:memo]
    session[:medicine] = record_params[:medicine]
    session[:awakening] = record_params[:awakening]
    @record = Record.new(user_id: current_user.id)
  end

  def show
    @record = Record.find(params[:id])
  end
  
  def create
    @record = Record.new(
                      user_id: session[:user_id],
                      memo: session[:memo],
                      medicine: session[:medicine],
                      awakening: session[:awakening],
                      sun: session[:sun],
                      getout: session[:getout],
                      sleepiness: session[:sleepiness],
                      memo: record_params[:memo]
                    )
    @record.user_id = current_user.id                  
    @record.save                  
    flash[:notice] = "登録しました"
    redirect_to done_records_path
  end
  
    private
   
    def record_params
      params.require(:record).permit(:getup_time, :sleep_time, :memo, :sun, :getout, :sleepiness, :medicine, :awakening, :user_id)
    end
    
    
end
