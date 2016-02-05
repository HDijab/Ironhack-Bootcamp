json.array!(@concerts) do |concert|
  json.extract! concert, :id, :artist, :venue, :city, :date, :price, :description
  json.url concert_url(concert, format: :json)
end
