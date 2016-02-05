json.array!(@location_requests) do |location_request|
  json.extract! location_request, :id, :lat, :long, :radius
  json.url location_request_url(location_request, format: :json)
end
