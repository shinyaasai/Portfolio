class DreamsController < ApplicationController
  def index
    @users = User.all
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
  end
end
