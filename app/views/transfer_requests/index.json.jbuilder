json.array!(@transfer_requests) do |transfer_request|
  json.extract! transfer_request, :id, :medium, :payee_id, :amount, :transaction_date, :status, :description
  json.url transfer_request_url(transfer_request, format: :json)
end
