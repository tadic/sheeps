json.array!(@uginuces) do |uginuce|
  json.extract! uginuce, :id, :sheep_id, :activity_id
  json.url uginuce_url(uginuce, format: :json)
end
