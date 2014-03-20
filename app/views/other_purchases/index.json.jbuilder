json.array!(@other_purchases) do |other_purchase|
  json.extract! other_purchase, :id, :activity_id, :what, :why
  json.url other_purchase_url(other_purchase, format: :json)
end
