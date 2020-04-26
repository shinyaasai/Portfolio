class UserStatusesController < ApplicationController
  def home
    user = User.find_by(params[user_id: current_user.id])
    @records = user.records
    @average = 0
    @this_month = Date.today.all_week
    start_date = Time.current.beginning_of_week
    end_date = Time.current.end_of_week
    @this_month_record = @records.where(getup_time: start_date..end_date).group('WEEK(getup_time)').count
  end
end
