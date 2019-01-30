# frozen_string_literal: true

class PostService < Polist::Service
  class Form < Polist::Service::Form
    attribute :title, :String
    attribute :body, :String
    attribute :ip
    attribute :user_id, :Integer

    validates :title, :body, :user_id, presence: true
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
    if User[@post_data["user_id"]]
      Post.create(@post_data)
    else
      @post_new = Post.new(@post_data)
      @post_new.user = User.create(login: "Johansson", id: @post_data["user_id"])
      @post_new.save
    end
  end
end
