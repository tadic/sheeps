json.array!(@sheep) do |sheep|
  json.extract! sheep, :id, :code, :status, :describe, :percent_of_r, :sex, :nickname, :kod, :percent_of_lambings, :background, :age
  json.url sheep_url(sheep, format: :json)
end
