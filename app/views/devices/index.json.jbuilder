json.array!(@devices) do |device|
  json.extract! device, :id, :slip_id, :active, :device_number, :mac_address, :last_seen, :install_date, :software_version, :hardware_version, :current_status, :killed_date
  json.url device_url(device, format: :json)
end
