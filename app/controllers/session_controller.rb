class SessionController < ApplicationController
  before_action :set_alert, only: [:show, :edit, :update, :destroy]

  #POST 
  def changeUser
    session[:current_user] = params[:user_form][:user_id]
    redirect_to request.referrer
  end
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_params
      params.require(:alert).permit(:the_type, :description, :time, :merchant, :amount)
    end
end
