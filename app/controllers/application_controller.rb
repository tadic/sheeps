class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :sheep_many, :lamb_many, :sheeps_number_in_time, :current_user, :costs_in_time, :many_in_time
  def sheep_path
      '/sheep'
  end
  def check_current_user
    if current_user.nil?
      render new_session_path
    end
  end
  
  def current_user
    return nil if session[:user_id].nil? 
    User.find(session[:user_id]) 
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
  def sheeps_number_in_time
    arr = []
    arr.push(0);
    sheep_number = 0
    activities = Activity.all.sort_by{|a| a[:date]}
    upDate = 200    # january
    activities.each do |a|
      while a.date%10000 > upDate
        arr.push(sheep_number)
        upDate += 100
      end     
          if a.a_type=='jagnjenja'
            a.lambings.each do |l|
              if l.is_alive
                sheep_number += 1          
              end
            end
          elsif a.a_type == 'nabavka_ovaca'
              sheep_number += a.sheep_purchases.count
          elsif a.a_type == 'uginuce'
              sheep_number -= 1
          end   
    end
    arr.push(sheep_number)
    return arr
  end
  
  def costs_in_time
    arr = []
    costs = 0
    activities = Activity.all.sort_by{|a| a[:date]}
    upDate = 200    # january
    activities.each do |a|
      while a.date%10000 > upDate
        arr.push(-costs)
        costs = 0
        upDate += 100
      end     
          if  a.a_type=='ostale_nabavke' or a.a_type=='nabavka_ovaca'
            if a.total_costs != nil                   
            costs += a.total_costs
            end
          end   
    end
    arr.push(-costs)
    return arr
  end
  
  def many_in_time
    arr = []
    many = 0
    sellings = Activity.where(a_type: 'prodaja').sort_by{|a| a[:date]}
    upDate = 200    # january
    sellings.each do |a|
      while a.date%10000 > upDate
        arr.push(many)
        many = 0
        upDate += 100
      end     
      if a.total_costs != nil                   
        many += a.total_costs
      end  
    end
    arr.push(many)
    return arr
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
