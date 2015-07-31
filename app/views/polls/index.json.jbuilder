json.array!(@polls) do |poll|
  json.extract! poll, :id, :name, :reply, :id_facebook
  json.url poll_url(poll, format: :json)
end
