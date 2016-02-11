class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :set_session
  before_action :set_session
  include SessionHelper
  require 'open-uri'
  require 'json'
  require 'net/http'

  
  def set_session
    @session = Session.new
  end
  
end
