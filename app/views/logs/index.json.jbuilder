json.array!(@logs) do |log|
  json.extract! log, :id, :device_id, :status, :battery, :station_timestamp, :station_id
  json.url log_url(log, format: :json)
end
