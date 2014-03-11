class Sheep < ActiveRecord::Base
  
  scope :ready_for_lambing, -> { where "sex='zensko' AND not code=''" }
    
    has_one :birth, :class_name => 'Lambing', :foreign_key => 'lamb_id'
    has_many :lambings, :class_name => 'Lambing', :foreign_key => 'sheep_id'
    has_one :sheep_purchase
    
  def kod
   if code==nil
      'nije dodeljen'
    else
     return code
    end
  end
  def background
    if birth!=nil
      'sa farme'
    else
      sheep_purchase.activity.location
    end
  end
  def percent_of_lambings
    number_of_lambings = lambings.select(:activity_id).distinct.count
    number_of_lambs = lambings.count
    return 100* number_of_lambs / number_of_lambings
  end
  
  def birthweight
    if birth!=nil
      if birth.weight>0
        return birth.weight 
      end
      return 'nije mereno'
    else
      'napoznata'
    end
  end
  def born_date_and_place
    if birth!=nil
      return birth.activity.show_date  + ' - na farmi'
    else
      return sheep_purchase.show_date_of_birth + ' - lokacija nepoznata' 
    end
  end
   def nik_n
     if nickname==nil
      return 'nema'
     else
       return nickname
     end
     
   end
  def mother
    if birth!=nil
      return birth.sheep.code + ' - nadimak ' + nik_n 
    else
      return sheep_purchase.mother_code
    end 
  end

  def father
    if birth==nil
      return sheep_purchase.father_code
    else
      'u potrazi za...'
    end
  end
end
