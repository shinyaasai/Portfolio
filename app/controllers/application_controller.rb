class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require "date"
  
  def after_sign_in_path_for(resource)
    form1_records_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
end
