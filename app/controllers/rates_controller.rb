# frozen_string_literal: true

class RatesController < ApplicationController
  # POST /rates
  def create
    @rate = RateService.run(rate_params.to_h)
    @rate.success? ? (render json: @rate.response) \
     : (render json: @rate.response, status: :unprocessable_entity)
  end

  # POST rates/top_amount
  def top_amount
    @rate = AmountService.run(rate_params.to_h)
    @rate.success? ? (render json: @rate.response) \
     : (render json: @rate.response, status: :unprocessable_entity)
  end

  # GET rates/get_ip
  def get_ip
    @rate = IpService.call
    @rate.success? ? (render json: @rate.response) \
     : (render json: @rate.response, status: :unprocessable_entity)
  end

  private

  def rate_params
    params.permit(:value, :id, :amount)
  end
end
