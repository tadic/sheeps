class Sheep < ActiveRecord::Base
  
  scope :ready_for_lambing, -> { where "sex='zensko' AND not code=''" }
    
    has_one :birth, :class_name => 'Lambing', :foreign_key => 'lamb_id'
    has_many :lambings, :class_name => 'Lambing', :foreign_key => 'sheep_id'
    has_one :sheep_purchase
    has_one :uginuce, :dependent => :destroy
    has_many :vacinations, :dependent => :destroy
    
    def self_vacinations
      vacc = []
      vacinations.each do |v|
          if v.activity.a_type=='vakcinacija'
            vacc.push(v)
          end
      end
      return vacc
    end
    
    def code_nickname
      code.to_s + ' ' + nickname.to_s
    end
    
    def terapies
      vacc = []
      vacinations.each do |v| 
          if v.activity.a_type=='lecenje'
            vacc.push(v)
          end
      end
      return vacc
    end
  
  def kod
   if code==nil
      'nije dodeljen'
   else
     return code
   end
  end
  
  def background
    if sheep_purchase!= nil
        sheep_purchase.activity.location
    else
      'sa farme'
    end
  end
  
  def percent_of_lambings
    if number_of_lambings==0
      return 0
    end
    return 100* number_of_lambs / number_of_lambings
  end
  
def number_of_lambings
  lambings.select(:activity_id).distinct.count
end


def self.best_sheep(n)
  Sheep.all.sort_by{|a| a.percent_of_lambings}.last(n).reverse
end


def number_of_lambs
  lambings.count
end
  
  def birthweight
    if birth!=nil
      if birth.weight!=nil
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
