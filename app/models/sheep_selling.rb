class SheepSelling < ActiveRecord::Base
      belongs_to :activity
      belongs_to :sheep
      
      
      
  def pricekg
    if weight!=nil and price!=nil and weight != 0
      return price/weight
    end
    return ''
  end

end

