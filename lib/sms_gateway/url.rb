module SMSGateway
  class URL 
    def self.send_sms_uri
      URI('http://smsgateway.me/api/v3/messages/send')   
    end
  end
end
