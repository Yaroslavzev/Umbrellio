# frozen_string_literal: true

class RateService < Polist::Service
  class Form < Polist::Service::Form
    attribute :value, :Integer
    attribute :id, :Integer

    validates :value, :id, presence: true
  end

  def call
    if form.valid?
      success!(value_avr)
    else
      validate!
    end
  end

  private

  def value_avr
    @rate_data = as_json["form"]
    Rate.create(value: @rate_data["value"], post_id: @rate_data["id"])
    @averages = []
    Rate.where(post_id: @rate_data["id"]).in_batches(of: 1000) { |ds| @averages << ds.avg(:value) }
    @averages.reduce(:+) / @averages.size.to_f
  end
end
