class SheepPurchase < ActiveRecord::Base
    belongs_to :activity
    belongs_to :sheep, :dependent => :destroy
    
    
  def self.from_interval(start_date, end_date)
     Activity.where("a_type= 'nabavka_ovaca' AND date >  ? AND date < ?", start_date, end_date).sort_by{|a| a[:date]}
  end
  
  def show_date_of_birth
   if date_of_birth==nil || date_of_birth==0
     return 'prazno'
   end
    dat = date_of_birth.to_s
    d = dat.at(6..7) + '-'
    d += dat.at(4..5)  + '-'
    d += dat.at(0..3)
    return d
  end
end
