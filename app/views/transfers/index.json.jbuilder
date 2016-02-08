json.array!(@transfers) do |transfer|
  json.extract! transfer, :id, :uid, :the_type, :date, :status, :medium, :payer_id, :payee_id, :amount, :description
  json.url transfer_url(transfer, format: :json)
end
