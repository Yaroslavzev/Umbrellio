class IpService < Polist::Service

  def call
    #if form.valid?
      success!(getting_ip)

    #else
    #  validate!
    #end

  end



  private

  def getting_ip
    Post.joins(:user).group("posts.ip").select("posts.ip, json_agg(DISTINCT login)")
  end
end
