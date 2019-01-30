require 'rails_helper'

describe Post, type: :model do



  describe 'attributes' do

    subject { Post.new }

    it "allows reading and writing for :login" do
      subject.title = 'Test'
      expect(subject.title).to eq('Test')
      expect(subject.title).to be_kind_of(String)
    end

    it "allows reading and writing for :body" do
      subject.body = 'Test'
      expect(subject.body).to eq('Test')
      expect(subject.body).to be_kind_of(String)
    end

    it "allows reading and writing for :ip" do
      subject.ip = IPAddr.new("55.245.90.102")
      expect(subject.ip).to eq(IPAddr.new("55.245.90.102"))
      expect(subject.ip).to be_kind_of(IPAddr)
    end


    it "has many user"  do
      expect(subject).to have_one_to_many(:rates)
    end

    it "has many rate"  do
      expect(subject).to have_many_to_one(:user)
    end

  end
end
