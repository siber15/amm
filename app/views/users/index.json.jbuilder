json.array!(@users) do |user|
  json.extract! user, :id, :user_type, :email, :password, :name
  json.url user_url(user, format: :json)
end
