class AmountService < Polist::Service

  class Form < Polist::Service::Form
    attribute :amount#, :String

    validates :amount, presence: true
  end

  def call
    if form.valid?
      success!(finding)

    else
      validate!
    end

  end
  
  private

  def finding
    @rate_data = self.as_json["form"]
    Rate.joins(:post).distinct.pluck(:ip).uniq.map{|finded_ip| Rate.joins(:post).where(post: Post.find_by(ip: finded_ip)).average(:value)}.sort_by{ |a| a }.reverse.first(@rate_data["amount"])
  end
end
