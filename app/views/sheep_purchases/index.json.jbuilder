json.array!(@sheep_purchases) do |sheep_purchase|
  json.extract! sheep_purchase, :id, :price, :place, :activity_id, :sheep_id, :comment
  json.url sheep_purchase_url(sheep_purchase, format: :json)
end
