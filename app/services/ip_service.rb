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
    #@rate_data = self.as_json["form"]
    Post.all.distinct.pluck(:ip).uniq.map do |finded_ip|
      {ip:    Post.find_by(ip: finded_ip).ip.to_s,
       login: Post.where(ip: finded_ip).map { |post| post.user.login}#_by(ip: finded_ip))
      }
    end
  end
end
