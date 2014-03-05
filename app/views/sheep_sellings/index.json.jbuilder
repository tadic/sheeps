json.array!(@sheep_sellings) do |sheep_selling|
  json.extract! sheep_selling, :id, :activity_id, :sheep_id, :weight, :price, :place, :comment
  json.url sheep_selling_url(sheep_selling, format: :json)
end
