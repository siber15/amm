json.array!(@stations) do |station|
  json.extract! station, :id, :harbour_id, :placement, :ip, :last_seen
  json.url station_url(station, format: :json)
end
