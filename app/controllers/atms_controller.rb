class AtmsController < ApplicationController
  before_action :set_atm, only: [:show, :edit, :update, :destroy]

  # GET /atms
  # GET /atms.json
  def index
    @atms = Atm.all
  end

  # GET /atms/1
  # GET /atms/1.json
  def show



  end

  # GET /atms/new
  def new
    @atm = Atm.new
  end

  # GET /atms/1/edit
  def edit
    address = @atm.hours 
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + address + "&key=" + Rails.application.secrets[:google_api_key] 
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
    @atm.name = c1_result["data"].length
  end

  # POST /atms
  # POST /atms.json
  def create
    @atm = Atm.new(atm_params)

    respond_to do |format|
      if @atm.save
        format.html { redirect_to @atm, notice: 'Atm was successfully created.' }
        format.json { render :show, status: :created, location: @atm }
      else
        format.html { render :new }
        format.json { render json: @atm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atms/1
  # PATCH/PUT /atms/1.json
  def update
    respond_to do |format|
      if @atm.update(atm_params)
        format.html { redirect_to edit_atm_path(@atm)}
      else
        format.html { render :edit }
        format.json { render json: @atm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atms/1
  # DELETE /atms/1.json
  def destroy
    @atm.destroy
    respond_to do |format|
      format.html { redirect_to atms_url, notice: 'Atm was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atm
      @atm = Atm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atm_params
      params.require(:atm).permit(:lat, :long, :uid, :name, :languages, :hours, :accessibility, :amount_left)
    end
end
