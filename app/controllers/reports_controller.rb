class ReportsController < ApplicationController
def index
  
end

def report
  start_date = convert_date_to_i(params[:start_date])
  end_date = convert_date_to_i(params[:end_date])
  if start_date!='' and start_date!=nil and end_date!=nil and end_date!= '' and end_date>start_date
     @lambings = Lambing.from_interval(start_date, end_date)
     @s_purchases = SheepPurchase.from_interval(start_date, end_date)
     @vacinations = Vacination.vac_from_interval(start_date, end_date)
     @lecenja = Vacination.lek_from_interval(start_date, end_date)
     @o_purchases = OtherPurchase.from_interval(start_date, end_date)
     @sellings = SheepSelling.from_interval(start_date, end_date)
  else
  end

end
end