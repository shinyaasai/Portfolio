class RecordsController < ApplicationController
  
  def index
  end
  
  def new
    @record = Record.new
  end
  
  def create
    @record = Record.create(record_params)
    redirect_to root_path
  end
  
    private
   
    def record_params
      params.require(:record).permit(:getup_time, :sleep_time, :awakening, :medicine, :sun, :memo)
    end
end
