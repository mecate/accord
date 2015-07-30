json.array!(@polls) do |poll|
  json.extract! poll, :id, :name, :reply
  json.url poll_url(poll, format: :json)
end
