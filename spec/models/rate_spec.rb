require 'rails_helper'

RSpec.describe "Rate" do

  describe 'attributes' do

    subject { Rate.new }

    it "allows reading and writing for :value" do
      subject.value = 1
      expect(subject.value).to eq(1)
      expect(subject.value).to be_kind_of(Integer)
    end

    it "has many posts"  do
      expect(subject).to have_many_to_one(:post)
    end

  end
end
