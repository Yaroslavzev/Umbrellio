# frozen_string_literal: true

class IpService < Polist::Service
  def call
    success!(getting_ip)
  end

  private

  def getting_ip
    Post.association_left_join(:user)
                    .select_group(:ip)
                    .select(Sequel[:posts][:ip])
                    .select_append { array_agg(:login).distinct }
  end
end
