json.array!(@data_logs) do |data_log|
  json.extract! data_log, :id, :device_id, :status, :battery, :station_timestamp, :station_id
  json.url data_log_url(data_log, format: :json)
end
