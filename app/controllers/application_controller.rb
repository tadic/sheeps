class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :sheep_many, :lamb_many
  def sheep_path
      '/sheep'
  end
 def convert_date_to_i(date)
    if date==nil or date.length<9
      return 0
    end
      d = date.at(6..9)
      d += date.at(3..4)
      d += date.at(0..1)
     return d.to_i
 end
 
  def sheep_many(n)
    case (n%10)
      when 1
        n.to_s + " ovca"
      when 2 
        n.to_s + " ovce"
      when 3 
        n.to_s + " ovce"
      when 4 
        n.to_s + " ovce"
      else
        n.to_s + " ovaca"
    end     
  end
  def lamb_many(n)
    case (n%10)
      when 1
        n.to_s + " jagnje"
      when 2 
        n.to_s + " jagnjeta"
      when 3 
        n.to_s + " jagnjeta"
      when 4 
        n.to_s + " jagnjeta"
      else
        n.to_s + " jagnjadi"
    end     
  end
 

end
