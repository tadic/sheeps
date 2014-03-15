json.array!(@removes) do |remove|
  json.extract! remove, :id, :death
  json.url remove_url(remove, format: :json)
end
