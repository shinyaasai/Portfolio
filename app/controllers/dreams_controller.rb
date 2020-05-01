class DreamsController < ApplicationController
  def index
    @dreams = params[:tag_id].present? ? Tag.find(params[:tag_id]).records : Record.all.order(getup_time: :desc)
  end

  def show
    @record = Record.find(params[:id])
    @user_name = @record.user.user_name
  end
end
