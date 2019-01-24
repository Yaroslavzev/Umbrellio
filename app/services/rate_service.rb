class RateService < Polist::Service

  class Form < Polist::Service::Form
    attribute :value#, :String
    attribute :ip#, :Inet #, default: "smth"

    validates :value, presence: true
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
    Rate.create(value: @rate_data["value"], post: Post.find_by(ip: IPAddr.new(@rate_data["ip"])))

    Rate.joins(:post).where(post: Post.find_by(ip: IPAddr.new(@rate_data["ip"]))).average(:value)

  end

  def callbacks
  end
  private

end
