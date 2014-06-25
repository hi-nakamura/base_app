class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :miniprofiler

  def miniprofiler
    if Rails.env.development? || Settings.display_profiler
      Rack::MiniProfiler.authorize_request
    end
  end
end
