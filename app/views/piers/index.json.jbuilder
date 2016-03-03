json.array!(@piers) do |pier|
  json.extract! pier, :id, :harbour_id, :name
  json.url pier_url(pier, format: :json)
end
