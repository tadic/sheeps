class SheepSelling < ActiveRecord::Base
      belongs_to :activity
      belongs_to :sheep
      
      
  def self.from_interval(start_date, end_date)
     Activity.where("a_type= 'prodaja' AND date >  ? AND date < ?", start_date, end_date).sort_by{|a| a[:date]}
  end   
  def pricekg
    if weight!=nil and price!=nil and weight != 0
      return price/weight
    end
    return ''
  end

end

