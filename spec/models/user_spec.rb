require 'rails_helper'

RSpec.describe "User" do

  describe 'attributes' do

    subject { User.new }

    it "allows create :login" do
      subject.login = 'Test'
      expect(subject.login).to eq('Test')
    end
  end
end
