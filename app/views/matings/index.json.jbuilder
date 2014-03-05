json.array!(@matings) do |mating|
  json.extract! mating, :id, :male_id, :price, :activity_id, :sheep_id, :comment
  json.url mating_url(mating, format: :json)
end
