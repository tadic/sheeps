json.array!(@mortalities) do |mortality|
  json.extract! mortality, :id, :date, :sheep_id, :describe
  json.url mortality_url(mortality, format: :json)
end
