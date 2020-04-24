class UserStatusesController < ApplicationController
  def home
    user = User.find_by(params[user_id: current_user.id])
    @records = user.records
    @average = 0
  end
end
