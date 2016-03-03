json.array!(@harbours) do |harbour|
  json.extract! harbour, :id, :name, :address, :zip, :city, :country, :phone, :description, :active
  json.url harbour_url(harbour, format: :json)
end
