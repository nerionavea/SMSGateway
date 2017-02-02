require 'spec_helper' 

RSpec.describe SMSGateway::URL do 
  describe "::send_sms_uri" do 
    it "should return the sms send uri" do 
      expect(SMSGateway::URL.send_sms_uri).to eq(URI('http://smsgateway.me/api/v3/messages/send'))
    end
  end
end
