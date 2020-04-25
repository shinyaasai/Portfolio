class UserStatusesController < ApplicationController
  def home
    user = User.find_by(params[user_id: current_user.id])
    @records = user.records
    @average = 0
    @this_month = Date.today.all_month
    start_date = Time.current.beginning_of_month
    end_date = Time.current.end_of_month
    @this_month_record = @records.where(getup_time: start_date..end_date).group('MONTH(getup_time)').count
  end
end
