json.array!(@bases) do |basis|
  json.extract! basis, :id, :harbour_id, :placement, :ip, :last_seen, :harbour_id
  json.url basis_url(basis, format: :json)
end
