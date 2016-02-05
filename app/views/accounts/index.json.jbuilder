json.array!(@accounts) do |account|
  json.extract! account, :id, :uid, :type, :nickname, :rewards, :balance, :account_number, :customer_id
  json.url account_url(account, format: :json)
end
