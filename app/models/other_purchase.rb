class OtherPurchase < ActiveRecord::Base
      belongs_to :activity, :dependent => :destroy
      
  def self.from_interval(start_date, end_date)
     Activity.where("a_type= 'ostale_nabavke' AND date >  ? AND date < ?", start_date, end_date).sort_by{|a| a[:date]}
  end
  
end
