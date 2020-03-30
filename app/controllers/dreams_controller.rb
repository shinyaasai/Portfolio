class DreamsController < ApplicationController
  def index
    @users = User.all
    @records = Record.all
  end
end
