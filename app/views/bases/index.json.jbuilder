json.array!(@bases) do |bases|
  json.extract! bases, :id, :harbour_id, :placement, :ip, :last_seen, :harbour_id
  json.url bases_url(bases, format: :json)
end
