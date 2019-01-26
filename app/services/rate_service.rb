class RateService < Polist::Service

  class Form < Polist::Service::Form
    attribute :value#, :String
    attribute :id

    validates :value, :id, presence: true
  end

  def call
    if form.valid?
      success!(save)

    else
      validate!
    end

  end

  def save
    @rate_data = self.as_json["form"]
    Rate.create(value: @rate_data["value"], post: Post.find(@rate_data["id"]))

    Rate.joins(:post).where(post: Post.find(@rate_data["id"])).average(:value)

  end

  def callbacks
  end
  private

end
