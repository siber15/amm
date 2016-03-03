json.array!(@slips) do |slip|
  json.extract! slip, :id, :slip_number, :pier_id
  json.url slip_url(slip, format: :json)
end
