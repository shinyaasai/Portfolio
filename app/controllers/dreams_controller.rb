class DreamsController < ApplicationController
  def index
    @records = params[:tag_id].present? ? Tag.find(params[:tag_id]).records : Record.all
    @records = @records.page(params[:page])
  end

  def show
    @record = Record.find(params[:id])
    @user_name = @record.user.user_name
  end
end
