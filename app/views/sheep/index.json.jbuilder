json.array!(@sheep) do |sheep|
  json.extract! sheep, :id, :code, :mother_id, :father_id, :weight_100_days
  json.url sheep_url(sheep, format: :json)
end
