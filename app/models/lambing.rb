class Lambing < ActiveRecord::Base
  belongs_to :lamb, :class_name => 'Sheep', :foreign_key => 'lamb_id', :dependent => :destroy
  belongs_to :sheep, :class_name => 'Sheep', :foreign_key => 'sheep_id'
  belongs_to :activity
  
  
  def self lamb_number
    lambings = Lambing.find(:all, :select => "activity_id, sheep_id, count(*) AS count", :group => "activity_id, sheep_id")
    return lambings.where(count :'1').count 
  end

end