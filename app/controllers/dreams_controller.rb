class DreamsController < ApplicationController
  def index
    @records = Record.all
  end
end
