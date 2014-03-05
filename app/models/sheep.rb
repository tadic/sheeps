class Sheep < ActiveRecord::Base
    has_one :birth, :class_name => 'Lambing', :foreign_key => 'lamb_id'
    has_many :lambings, :class_name => 'Lambing', :foreign_key => 'sheep_id'
    
  def kod
   if code==nil
      'nije dodeljen'
    else
     return code
    end
  end
end
