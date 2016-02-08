json.array!(@alerts) do |alert|
  json.extract! alert, :id, :the_type, :description, :time, :merchant, :amount
  json.url alert_url(alert, format: :json)
end
