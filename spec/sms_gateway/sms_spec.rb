require 'spec_helper' 

RSpec.describe SMSGateway::SMS do 
  describe "::new" do 
    describe "when is valid" do 
      let(:sms) { SMSGateway::SMS.new(number: "04125491920", message: "Hi world") }
      before { sms.set_user(email: ENV["SMSGATEWAY_EMAIL"], password: ENV["SMSGATEWAY_PASSWORD"]) } 

      it "should return a valid sms" do 
        expect(sms.valid?).to be(true)  
      end

      describe "#deliver" do 
        it "should response success" do 
          expect(sms.deliver.success?).to be(true)
        end
      end
    end

    describe "when is not valid" do 
      let(:sms_with_invalid_number_characters) { SMSGateway::SMS.new(number: "invalid1234", message: "Hi world") }
      let(:sms_with_empty_number) { SMSGateway::SMS.new(number: "", message: "Hi world") }
      let(:sms_with_empty_message) { SMSGateway::SMS.new(number: "04125491920", message: "") }

      it "should return a invalid sms when number have invalid characters" do 
        expect(sms_with_invalid_number_characters.valid?).to be(false)  
      end

      it "should return a invalid sms when it have an emtpy number" do 
        expect(sms_with_empty_number.valid?).to be(false) 
      end

      it "should return a invalid sms when it have an empty message" do 
        expect(sms_with_empty_message.valid?).to be(false) 
      end
    end
  end
end
