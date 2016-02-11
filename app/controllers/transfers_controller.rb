class TransfersController < ApplicationController
  before_action :set_transfer, only: [:show, :edit, :update, :destroy]

  # GET /transfers
  # GET /transfers.json
  def index
    @transfers = Transfer.all
  end

  # GET /transfers/1
  # GET /transfers/1.json
  def show
  end

  # GET /transfers/new
  def new
    @transfer = Transfer.new
  end

  # GET /transfers/1/edit
  def edit
    user_id=session[:current_user]
    get_customers_accounts_url = "http://api.reimaginebanking.com/customers/" + user_id + "/accounts?key=" + Rails.application.secrets[:nessie_api_key]
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

    #response = open(url).read
    #result = JSON.parse(response)
    #@transfer.json_result = result
  end

  # POST /transfers
  # POST /transfers.json
  def create
    @transfer = Transfer.new(transfer_params)

    respond_to do |format|
      if @transfer.save
        format.html { redirect_to @transfer, notice: 'Transfer was successfully created.' }
        format.json { render :show, status: :created, location: @transfer }
      else
        format.html { render :new }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transfers/1
  # PATCH/PUT /transfers/1.json
  def update
    uri = URI("http://api.reimaginebanking.com/accounts/" + params[:transfer][:payer_id] + "/transfers?key=" + Rails.application.secrets[:nessie_api_key])
    req = Net::HTTP::Post.new(uri)
    those_params = {'medium' => params[:transfer][:medium], 'payee_id' => params[:transfer][:payee_id], 'amount' => params[:transfer][:amount], 'transaction_date' => Time.new.to_s, 'description' => params[:transfer][:description]}

    req.body=those_params.to_json
    res = Net::HTTP.start(uri.hostname,uri.port) do |http|
      http.request(req)
    end

    binding.pry
    resp = Net::HTTP.post_form(init_transfer_url, initheader = {'Content-Type' =>'application/json'}, those_params.to_json)
    respond_to do |format|
      if @transfer.update(transfer_params)
        format.html { redirect_to @transfer, notice: 'Transfer was successfully updated.' }
        format.json { render :show, status: :ok, location: @transfer }
      else
        format.html { render :edit }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transfers/1
  # DELETE /transfers/1.json
  def destroy
    @transfer.destroy
    respond_to do |format|
      format.html { redirect_to transfers_url, notice: 'Transfer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = Transfer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_params
      params.require(:transfer).permit(:uid, :the_type, :date, :status, :medium, :payer_id, :payee_id, :amount, :description)
    end
end
