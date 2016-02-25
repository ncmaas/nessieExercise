class ExercisesController < ApplicationController
  before_action :set_account

  def count
  	unless session[:atm_address]
  		session[:atm_address] = "8020 Towers Crescent Dr, Vienna, VA 22182"
  	end
  	@address = session[:atm_address] 
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @address + "&key=" + Rails.application.secrets[:google_api_key] 
    response = open(url).read 
    result = JSON.parse(response) 
    if result["results"][0]["geometry"]["bounds"] 
      lat = result["results"][0]["geometry"]["bounds"]["northeast"]["lat"] 
      lng = result["results"][0]["geometry"]["bounds"]["northeast"]["lng"] 
    else 
      lat = result["results"][0]["geometry"]["location"]["lat"]
      lng = result["results"][0]["geometry"]["location"]["lng"]
    end
    c1_url = "http://api.reimaginebanking.com/atms?lat=" + lat.to_s + "&lng=" + lng.to_s + "&rad=50&key=" + Rails.application.secrets[:nessie_api_key] 
    c1_response = open(c1_url).read 
    c1_result = JSON.parse(c1_response) 
    @count = c1_result["data"].length
  end

  def transfer
    user_id=session[:current_user]
    get_customers_accounts_url = "http://api.reimaginebanking.com/customers/" + @user_id + "/accounts?key=" + Rails.application.secrets[:nessie_api_key]
    response = open(get_customers_accounts_url).read
    result = JSON.parse(response)
    @acct_array = []
    @transfers_array = []
    for n in 0..(result.length - 1) do
      @acct_array.push(result[n])
      new_url = "http://api.reimaginebanking.com/accounts/" + result[n]["_id"] + "/transfers?key=" +  Rails.application.secrets[:nessie_api_key]
      new_response = open(new_url).read
      new_result = JSON.parse(new_response)
      unless new_result.empty?
        @transfers_array.push(new_result)
      end
    end
    all_accounts_url = "http://api.reimaginebanking.com/accounts?key=" + Rails.application.secrets[:nessie_api_key]
    all_accts_resp = open(all_accounts_url).read
    all_acts_res = JSON.parse(all_accts_resp)
    @all_accts = all_acts_res.map{|a| [a["nickname"],a["_id"]]}
    @select_account = @acct_array.map{|a| [a["nickname"],a["_id"]]}
    @all_accts_flat = Hash[*@all_accts.flatten(1)]
    @acct_hash = @all_accts_flat.invert
  end

  def postTransfer
    binding.pry
    uri = URI("http://api.reimaginebanking.com/accounts/" + params[:payer_id] + "/transfers?key=" + Rails.application.secrets[:nessie_api_key])
    those_params = {'medium' => params[:medium], 'payee_id' => params[:payee_id], 'amount' => params[:amount].to_i, 'transaction_date' => Date.today.to_s, 'description' => params[:description]}
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri, initheader = {'Content-Type' =>'application/json'})
    request.body=those_params.to_json
    resp = http.request(request)
    respond_to do |format|
      format.html { redirect_to '/transfers'}
    end
  end

  def balance
    url = "http://api.reimaginebanking.com/customers/" + @user_id + "/accounts?key=" +  Rails.application.secrets[:nessie_api_key]
    response = open(url).read
    @accounts = JSON.parse(response)
    @accounts.each do |f|
	    purchases_url = "http://api.reimaginebanking.com/accounts/" + f["_id"] + "/purchases?key=" + Rails.application.secrets[:nessie_api_key] 
	    purchase_response = JSON.parse(open(purchases_url).read)
	    purchase_response.each do |p|
	    	merchant_url = "http://api.reimaginebanking.com/enterprise/merchants/" + p["merchant_id"]+ "?key=" + Rails.application.secrets[:nessie_api_key]
	    	merchant_response = JSON.parse(open(merchant_url).read)
	    	name = merchant_response["name"]
	    	p["merchant_name"] = name
	    end
		f["purchases"] = purchase_response

    end
  end

  def merchants
  	
  end
end