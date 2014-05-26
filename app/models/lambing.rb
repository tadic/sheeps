class Lambing < ActiveRecord::Base
  belongs_to :lamb, :class_name => 'Sheep', :foreign_key => 'lamb_id', :dependent => :destroy
  belongs_to :sheep, :class_name => 'Sheep', :foreign_key => 'sheep_id'
  belongs_to :activity
  
  
  def self lamb_number
    lambings = Lambing.find(:all, :select => "activity_id, sheep_id, count(*) AS count", :group => "activity_id, sheep_id")
    return lambings.where(count :'1').count 
  end

def  self.from_interval(start_date, end_date)
  @lambings = Activity.where("a_type= 'jagnjenja' AND date >  ? AND date < ?", start_date, end_date).sort_by{|a| a[:date]}
end
end