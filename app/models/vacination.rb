class Vacination < ActiveRecord::Base
      belongs_to :activity
      belongs_to :sheep
end
