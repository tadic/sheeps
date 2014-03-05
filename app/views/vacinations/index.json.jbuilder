json.array!(@vacinations) do |vacination|
  json.extract! vacination, :id, :reason, :vaccin_name, :activity_id, :sheep_id, :comment
  json.url vacination_url(vacination, format: :json)
end
