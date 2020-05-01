class UserStatusesController < ApplicationController
  before_action :authenticate_user!

  def home
    @records = current_user.records
    @average = 0
    @this_month = Date.today.all_week
    @this_month_record = @records.getup_time_this_week
  end
end
