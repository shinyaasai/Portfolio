class DreamsController < ApplicationController
  def index
    @records = Record.all.select(:user_id, :memo)
  end
end
