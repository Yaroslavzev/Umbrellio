class MyService < Polist::Service
  def call
    if params[:ok]
      success!(code: :cool)
    else
      fail!(code: :not_cool)
    end
  end
end
