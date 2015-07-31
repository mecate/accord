json.array!(@relationpolls) do |relationpoll|
  json.extract! relationpoll, :id, :user, :donator
  json.url relationpoll_url(relationpoll, format: :json)
end
