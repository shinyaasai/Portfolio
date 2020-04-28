class UserStatusesController < ApplicationController
  before_action :authenticate_user!
  
  def home
    @records = current_user.records
    @average = 0
    @this_month = Date.today.all_week
    start_date = Time.current.beginning_of_week
    end_date = Time.current.end_of_week
    @this_month_record = @records.where(getup_time: start_date..end_date).group('WEEK(getup_time)').count
  end
end
