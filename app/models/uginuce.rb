class Uginuce < ActiveRecord::Base
    belongs_to :sheep
    belongs_to :activity, :dependent => :destroy
end
