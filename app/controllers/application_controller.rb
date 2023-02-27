class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    puts "------------------ code before every request ------------------"
    # TODO: @current_user = ...
  end
end
