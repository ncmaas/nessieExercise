class TransferRequestsController < ApplicationController
  before_action :set_transfer_request, only: [:show, :edit, :update, :destroy]

  # GET /transfer_requests
  # GET /transfer_requests.json
  def index
    @transfer_requests = TransferRequest.all
  end

  # GET /transfer_requests/1
  # GET /transfer_requests/1.json
  def show
  end

  # GET /transfer_requests/new
  def new
    @transfer_request = TransferRequest.new
  end

  # GET /transfer_requests/1/edit
  def edit
  end

  # POST /transfer_requests
  # POST /transfer_requests.json
  def create
    @transfer_request = TransferRequest.new(transfer_request_params)

    respond_to do |format|
      if @transfer_request.save
        format.html { redirect_to @transfer_request, notice: 'Transfer request was successfully created.' }
        format.json { render :show, status: :created, location: @transfer_request }
      else
        format.html { render :new }
        format.json { render json: @transfer_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transfer_requests/1
  # PATCH/PUT /transfer_requests/1.json
  def update
    respond_to do |format|
      if @transfer_request.update(transfer_request_params)
        format.html { redirect_to @transfer_request, notice: 'Transfer request was successfully updated.' }
        format.json { render :show, status: :ok, location: @transfer_request }
      else
        format.html { render :edit }
        format.json { render json: @transfer_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transfer_requests/1
  # DELETE /transfer_requests/1.json
  def destroy
    @transfer_request.destroy
    respond_to do |format|
      format.html { redirect_to transfer_requests_url, notice: 'Transfer request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer_request
      @transfer_request = TransferRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_request_params
      params.require(:transfer_request).permit(:medium, :payee_id, :amount, :transaction_date, :status, :description)
    end
end
