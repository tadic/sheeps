json.array!(@lambings) do |lambing|
  json.extract! lambing, :id, :date, :sheep_id, :comment
  json.url lambing_url(lambing, format: :json)
end
