class ApplicationController < ActionController::Base
  include ApplicationHelper ::SessionsHelper

before_action :authorized
helper_method :current_user
helper_method :logged_in?




end
