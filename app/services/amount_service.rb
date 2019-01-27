class AmountService < Polist::Service
  SQL = "SELECT p.id, p.title, p.body, AVG(r.value) as rate FROM posts p JOIN rates r ON p.id = r.post_id GROUP BY p.id ORDER BY rate desc"

  class Form < Polist::Service::Form
    attribute :amount #, :String

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
    @rate_data = as_json["form"]

    # Example of ActiveRecord
    # Rate.joins(:post).group("posts.id").select("posts.id,posts.title,
    # posts.body, avg(rates.value) as rate").order('rate desc').limit(@rate_data["amount"])

    # Example of pure SQL
    Rate.with_sql(SQL).limit(@rate_data["amount"]).select(:title, :body)
  end
end
