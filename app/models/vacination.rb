class Vacination < ActiveRecord::Base
      belongs_to :activity
      belongs_to :sheep
      
  def self.vac_from_interval(start_date, end_date)
     Activity.where("a_type='vakcinacija' AND date >  ? AND date < ?", start_date, end_date).sort_by{|a| a[:date]}
  end
  def self.lek_from_interval(start_date, end_date)
     Activity.where("a_type= 'lecenje' AND date >  ? AND date < ?", start_date, end_date).sort_by{|a| a[:date]}
  end
end
