json.array!(@atms) do |atm|
  json.extract! atm, :id, :lat, :long, :uid, :name, :languages, :hours, :accessibility, :amount_left
  json.url atm_url(atm, format: :json)
end
