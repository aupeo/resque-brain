class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from NoSuchResque do |exception|
    render text: exception.message, status: 404
  end

  unless Rails.env.test?
    rescue_from Exception, with: :render_error
  end

  def render_error(exception)
    Rails.logger.fatal exception
    Rails.logger.fatal exception.backtrace.join("\n")
    respond_to do |format|
      format.html { raise exception }
      format.all  { render text: exception.message, status: 500 }
    end
  end
end
