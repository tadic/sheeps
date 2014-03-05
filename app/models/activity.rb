class Activity < ActiveRecord::Base
  has_many :lambings, :dependent => :destroy
  has_many :sheeps, through: :lambings
  has_many :lambs, through: :lambings
  def self.types
   Hash["jagnjenje"=> "lambing", "vakcinacija"=>"vacintion", "nabavka ovaca"=>"sheep_purchasing", "parenje"=>"mating", "prodaja"=>"selling"]
  end

  def females_count
    return lambs.where("sex = ?", 'zensko').count
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
