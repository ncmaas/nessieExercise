class LocationRequestsController < ApplicationController
  before_action :set_location_request, only: [:show, :edit, :update, :destroy]

  # GET /location_requests
  # GET /location_requests.json
  def index
    @location_requests = LocationRequest.all
  end

  # GET /location_requests/1
  # GET /location_requests/1.json
  def show
  end

  # GET /location_requests/new
  def new
    @location_request = LocationRequest.new
  end

  # GET /location_requests/1/edit
  def edit
  end

  # POST /location_requests
  # POST /location_requests.json
  def create
    @location_request = LocationRequest.new(location_request_params)

    respond_to do |format|
      if @location_request.save
        format.html { redirect_to @location_request, notice: 'Location request was successfully created.' }
        format.json { render :show, status: :created, location: @location_request }
      else
        format.html { render :new }
        format.json { render json: @location_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /location_requests/1
  # PATCH/PUT /location_requests/1.json
  def update
    respond_to do |format|
      if @location_request.update(location_request_params)
        format.html { redirect_to @location_request, notice: 'Location request was successfully updated.' }
        format.json { render :show, status: :ok, location: @location_request }
      else
        format.html { render :edit }
        format.json { render json: @location_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /location_requests/1
  # DELETE /location_requests/1.json
  def destroy
    @location_request.destroy
    respond_to do |format|
      format.html { redirect_to location_requests_url, notice: 'Location request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location_request
      @location_request = LocationRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_request_params
      params.require(:location_request).permit(:lat, :long, :radius)
    end
end
