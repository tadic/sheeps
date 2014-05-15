class Sheep < ActiveRecord::Base
  
  scope :ready_for_lambing, -> { where "sex='zensko' AND status='na farmi'" }
    scope :on_farm, -> { where status: 'na farmi'}
    has_one :birth, :class_name => 'Lambing', :foreign_key => 'lamb_id'
    has_many :lambings, :class_name => 'Lambing', :foreign_key => 'sheep_id'
    has_one :sheep_purchase
    has_one :sheep_selling
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
  Sheep.on_farm.sort_by{|a| [a.percent_of_lambings, a.birthdate]}.last(n).reverse
end

def birthdate
    if birth!=nil
     return birth.activity.date
    end
    return sheep_purchase.date_of_birth
end

def age_in_months
  b_date = birthdate
  current = (Time.now.strftime("%Y%m")).to_i
  return  12*(current/100 -  b_date/10000) + (current%100) - (b_date/100)%100
end

def age
  months = age_in_months
  if months < 12
    return (months).to_s + ' mes.'
  end
  if months > 100
    return '?'
  end
  return (months.to_f/12).round(1).to_s + ' god.'
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
  def birth_date
    if birth!=nil
      return birth.activity.show_date
    else
      return sheep_purchase.show_date_of_birth
    end
  end
  
  def birth_place
        if birth!=nil
          return 'na farmi'
        else
          return 'lokacija nepoznata'
        end
  end
  
   def nik_n
     if nickname==nil
      return 'nema'
     else
       return nickname
     end
     
   end
   def average_lambing
     
   end
   def self.best_female_lambs(n)
     females = Sheep.where("sex= 'zensko' AND status = 'na farmi'")
     best_f_l = []
     females.each do |f|
       if f.age_in_months < 8
          best_f_l.push(f)
       end
     end
     return best_f_l.sort_by{|a| [a.lambs_from_lambing, a.mother_rating]}.last(n).reverse
   end
   
   def mother_rating
    if birth!=nil
       return birth.sheep.lambs_from_lambing
    end
    return 0
   end
   
   def lambs_from_lambing
    if birth!=nil
      l = birth.activity.lambings
      return  l.where(sheep_id: mother_id).count
    end
    return 0
   end
   
  def from
    n = lambs_from_lambing
    if n > 0
      return n
    end
    return '?'
  end
  
  def mother
    if birth!=nil
      if birth.sheep.nickname!= ''
        return birth.sheep.nickname
      else
        return birth.sheep.code
      end
    else
      if sheep_purchase.mother_code==''
        return 'nepoznata'
      else
        return sheep_purchase.mother_code
      end
      
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
