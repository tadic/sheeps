json.array!(@activities) do |activity|
  json.extract! activity, :id, :tip, :color, :date, :time_from, :time_to, :total_costs, :comment
  json.url activity_url(activity, format: :json)
end
