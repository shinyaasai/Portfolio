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
    session["getup_time(1i)"] = record_params["getup_time(1i)"]
    session["getup_time(2i)"] = record_params["getup_time(2i)"]
    session["getup_time(3i)"] = record_params["getup_time(3i)"]
    session["getup_time(4i)"] = record_params["getup_time(4i)"]
    session["getup_time(5i)"] = record_params["getup_time(5i)"]
    session[:sun] = record_params[:sun]
    @record = Record.new(user_id: current_user.id)
  end
  def form4
    session[:sleepiness] = record_params[:sleepiness]
    @record = Record.new(user_id: current_user.id)
  end
  def form2
    session["sleep_time(1i)"] = record_params["sleep_time(1i)"]
    session["sleep_time(2i)"] = record_params["sleep_time(2i)"]
    session["sleep_time(3i)"] = record_params["sleep_time(3i)"]
    session["sleep_time(4i)"] = record_params["sleep_time(4i)"]
    session["sleep_time(5i)"] = record_params["sleep_time(5i)"]
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
                      "getup_time(1i)": session["getup_time(1i)"],
                      "getup_time(2i)": session["getup_time(2i)"],
                      "getup_time(3i)": session["getup_time(3i)"],
                      "getup_time(4i)": session["getup_time(4i)"],
                      "getup_time(5i)": session["getup_time(5i)"],
                      "sleep_time(1i)": session["sleep_time(1i)"],
                      "sleep_time(2i)": session["sleep_time(2i)"],
                      "sleep_time(3i)": session["sleep_time(3i)"],
                      "sleep_time(4i)": session["sleep_time(4i)"],
                      "sleep_time(5i)": session["sleep_time(5i)"],
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
      params.require(:record).permit( :'getup_time(1i)',:'getup_time(2i)',
                                      :'getup_time(3i)',:'getup_time(4i)',
                                      :'getup_time(5i)',
                                      :'sleep_time(1i)', :'sleep_time(2i)',
                                      :'sleep_time(3i)', :'sleep_time(4i)',
                                      :'sleep_time(5i)',
                                      :memo, :sun, :getout, :sleepiness,
                                      :medicine, :awakening, :user_id
                                     )
    end
    
    def sleep_avarage
       @sleep_avarage = Record.find(params[:id])
       @sleer_avarage = (Record.getup_time.to_i - Record.sleep_time.to_i) / 3600
    end
end