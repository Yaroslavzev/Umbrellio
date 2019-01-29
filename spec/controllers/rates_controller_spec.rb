require 'rails_helper'

RSpec.describe RatesController do
  describe "GET 'get_ip'" do

    it "returns http success" do
        get 'rate/get_ip'
        response.should be_success
      end
    end

end


#describe "GET 'index'" do
#  it "returns http success" do
#    get 'index'
#    response.should be_success
#  end
#end
#
#
#
#it 'creates resource and redirects to its page' do
#  expect { subject }.to change(Project, :count).by(1)
#  resource = Post.last
#  expect(project.name).to eq 'new_name'
#  expect(subject).to redirect_to project_path(resource)
#end
