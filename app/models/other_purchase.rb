class OtherPurchase < ActiveRecord::Base
      belongs_to :activity, :dependent => :destroy
end