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
    #Post.joins(:user).group("posts.ip").select("posts.ip, json_agg(DISTINCT login)")
    Post.with_sql("SELECT p.ip, json_agg(DISTINCT u.login) FROM posts p JOIN users u ON u.id = p.user_id GROUP BY p.ip")
  end
end
