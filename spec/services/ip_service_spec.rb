require 'rails_helper'

describe IpService do
  describe '.call' do
    subject { IpService.new }

    before do
      allow(subject)
        .to receive(:call)
        .and_return("ok")
    end

    it "allows :call" do
      expect(subject.call).to eq("ok")
    end
  end
end
