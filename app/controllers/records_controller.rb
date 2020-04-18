class RecordsController < ApplicationController
  require 'date'
  before_action :authenticate_user!
  before_action :validates_form1, only: :form2
  before_action :validates_form2, only: :form3
  before_action :validates_form3, only: :form4
  def done
    @records = Record.where(user_id: current_user.id).page(params[:page]).search(params[:search]).order(getup_time: :desc)
    @average = 0
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
    session[:getout] = record_params[:getout]
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
    record = Record.new(
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
    record.user_id = current_user.id
    if record.save
      flash[:notice] = "登録しました"
      redirect_to record
    else
      redirect_to done_records_path
    end
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    record = Record.find(params[:id])
    record.update_attributes(record_params)
    if record.save
      flash[:notice] = "更新しました"
      redirect_to record
    end
  end

  def destroy
    record = Record.find(params[:id])
    if record.destroy
      flash[:notice] = "削除しました"
      redirect_to done_records_path
    end
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

def validates_form1
  session["sleep_time(1i)"] = record_params["sleep_time(1i)"]
  session["sleep_time(2i)"] = record_params["sleep_time(2i)"]
  session["sleep_time(3i)"] = record_params["sleep_time(3i)"]
  session["sleep_time(4i)"] = record_params["sleep_time(4i)"]
  session["sleep_time(5i)"] = record_params["sleep_time(5i)"]
  session[:medicine] = record_params[:medicine]
  session[:awakening] = record_params[:awakening]
  @record = Record.new(
    user_id: current_user.id,
    "sleep_time(1i)": session["sleep_time(1i)"],
    "sleep_time(2i)": session["sleep_time(2i)"],
    "sleep_time(3i)": session["sleep_time(3i)"],
    "sleep_time(4i)": session["sleep_time(4i)"],
    "sleep_time(5i)": session["sleep_time(5i)"],
    medicine: session[:medicine],
    awakening: session[:awakening],
    "getup_time(1i)": '2020',
    "getup_time(2i)": '03',
    "getup_time(3i)": '23',
    "getup_time(4i)": '00',
    "getup_time(5i)": '00',
    sun: "浴びた",
    getout: "１０分",
    sleepiness: "元気に過ごせた"
  )
  render '/records/form1' unless @record.valid?
end

def validates_form2
  session["getup_time(1i)"] = record_params["getup_time(1i)"]
  session["getup_time(2i)"] = record_params["getup_time(2i)"]
  session["getup_time(3i)"] = record_params["getup_time(3i)"]
  session["getup_time(4i)"] = record_params["getup_time(4i)"]
  session["getup_time(5i)"] = record_params["getup_time(5i)"]
  session[:getout] = record_params[:getout]
  session[:sun] = record_params[:sun]
  @record = Record.new(
    user_id: current_user.id,
    "getup_time(1i)": session["getup_time(1i)"],
    "getup_time(2i)": session["getup_time(2i)"],
    "getup_time(3i)": session["getup_time(3i)"],
    "getup_time(4i)": session["getup_time(4i)"],
    "getup_time(5i)": session["getup_time(5i)"],
    "sleep_time(1i)": '2020',
    "sleep_time(2i)": '03',
    "sleep_time(3i)": '23',
    "sleep_time(4i)": '00',
    "sleep_time(5i)": '00',
    sun: session[:sun],
    getout: session[:getout],
    medicine: "飲んだ",
    awakening: "起きた",
    sleepiness: "元気に過ごせた"
  )
  render '/records/form2' unless @record.valid?
end

def validates_form3
  session[:sleepiness] = record_params[:sleepiness]
  @record = Record.new(
    user_id: current_user.id,
    sleepiness: session[:sleepiness],
    "sleep_time(1i)": '2020',
    "sleep_time(2i)": '03',
    "sleep_time(3i)": '23',
    "sleep_time(4i)": '00',
    "sleep_time(5i)": '00',
    "getup_time(1i)": '2020',
    "getup_time(2i)": '03',
    "getup_time(3i)": '23',
    "getup_time(4i)": '00',
    "getup_time(5i)": '00',
    medicine: "飲んだ",
    awakening: "起きた",
    sun: "浴びた",
    getout: "１０分"
  )
  render '/records/form3' unless @record.valid?
end
end
