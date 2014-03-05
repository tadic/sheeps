class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def sheep_path
      '/sheep'
  end
 def convert_date_to_i(date)
    if date.length<9
      return 0
    end
      d = date.at(6..9)
      d += date.at(3..4)
      d += date.at(0..1)
     return d.to_i
  end
end
