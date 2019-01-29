require 'rails_helper'

RSpec.describe "User" do

  describe 'attributes' do

    subject { User.new }

    it "allows reading and writing for  :login" do
      subject.login = 'Test'
      expect(subject.login).to eq('Test')
      expect(subject.login).to be_kind_of(String)
    end

    it "has many posts"  do
      expect(subject).to have_one_to_many(:posts)
    end

  end
end
