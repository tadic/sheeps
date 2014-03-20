class Activity < ActiveRecord::Base
  has_many :lambings, :dependent => :destroy
  has_many :sheep_purchases, :dependent => :destroy
  has_many :vacinations, :dependent => :destroy
  has_many :sheeps, through: :lambings
  has_many :vaccin_sheeps, through: :vacinations, :source => :sheep
  has_many :lambs, through: :lambings
  has_one :uginuce
  has_one :other_purchase
  def self.types
   Hash["jagnjenje"=> "lambing", "vakcinacija"=>"vacintion", "nabavka ovaca"=>"sheep_purchasing", "parenje"=>"mating", "prodaja"=>"selling"]
  end

  def females_total
       return lambs.where("sex = ?", 'zensko').count
  end
  
  def edit_path
      return '/lambings/'+id.to_s+'/edit' if a_type == 'jagnjenja'   
      return '/sheep_purchases/'+id.to_s+'/edit' if a_type == 'nabavka_ovaca'
      return '/vacinations/'+id.to_s+'/edit' if a_type == 'lecenje' || a_type == 'vakcinacija'
  end
  def show_path
      return '/lambings/'+id.to_s if a_type == 'jagnjenja'   
      return '/sheep_purchases/'+id.to_s if a_type == 'nabavka_ovaca'
      return '/vacinations/'+id.to_s if a_type == 'lecenje' || a_type == 'vakcinacija'
      return '/uginuces/'+id.to_s if a_type == 'uginuce'
  end  
  def females_alive
     allLambs =lambs.where(sex: 'zensko')
     i=0
     allLambs.each do |l|
       if l.birth.is_alive
        i += 1
       end 
     end
     return i
  end
  
 
  
  def lambs_total
    lambings.count
  end
  def lambs_alive
    lambings.where(is_alive: true).count
  end
  
 def show_date
   if date==nil || date==0
     return 'prazno'
   end
    dat = date.to_s
    d = dat.at(6..7) + '-'
    d += dat.at(4..5)  + '-'
    d += dat.at(0..3)
    return d
  end
end
