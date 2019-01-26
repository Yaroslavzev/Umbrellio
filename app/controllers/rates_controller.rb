class RatesController < ApplicationController
  before_action :set_rate, only: [:show, :update, :destroy]

  # GET /rates
  def index
    @rates = Rate.all

    render json: @rates
  end

  # GET /rates/1
  def show
    render json: @rate
  end

  # POST /rates
  def create
    @rate = RateService.run(rate_params.to_h)

    @rate.success? ? (render json: @rate.response) : (render json: @rate.response, status: 422)
  end

  # POST rates/top_amount
  def top_amount
    @rate = AmountService.run(rate_params.to_h)
    @rate.success? ? (render json: @rate.response) : (render json: @rate.response, status: 422)
  end

  # GET rates/get_ip
  def get_ip
    @rate = IpService.call#(rate_params.to_h)
    render json: @rate.response
    #@rate.success? ? (render json: @rate.response) : (render json: @rate.response, status: 422)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rate
    @rate = Rate.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def rate_params
    params.permit(:value, :id, :amount)
  end
end
