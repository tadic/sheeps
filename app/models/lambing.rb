class Lambing < ActiveRecord::Base
  belongs_to :lamb, :class_name => 'Sheep', :foreign_key => 'lamb_id', :dependent => :destroy
  belongs_to :sheep, :class_name => 'Sheep', :foreign_key => 'sheep_id'
  belongs_to :activity
end
