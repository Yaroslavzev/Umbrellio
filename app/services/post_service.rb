class PostService < Polist::Service
  class Form < Polist::Service::Form
    attribute :title#, :String
    attribute :body#, :String
    attribute :ip#, :Inet #, default: "smth"
    attribute :user_id#, :Integer

    validates :title, :body, presence: true
  end

  def call
    if form.valid?
      success!(save)
    else
      validate!
    end
  end

  private

  def save
    @post_data = as_json["form"]
    unless User[@post_data["user_id"]].exists?
      @post_new = Post.new(@post_data)
      @post_new.user = User.create(login: "Johansson", id: @post_data["user_id"])
      p @post_new.save
    else
      Post.create(@post_data)
    end
  end
end
