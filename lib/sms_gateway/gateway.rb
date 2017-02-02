require 'net/http' 
require 'json' 

module SMSGateway
  class Gateway
    def initialize

    end

    def send_sms(sms)
      respond(send_sms_request(sms))  
    end

    private

    def respond(net_http_response) 
      Response.new(net_http_response) 
    end

    def send_sms_request(sms) 
      Net::HTTP.post_form(
        urls.send_sms_uri,
        "email" => sms.user.email, 
        "password" => sms.user.password,
        "device" => sms.device, 
        "number" => sms.number, 
        "message" => sms.message
      )
    end

    def urls
      SMSGateway::URL
    end

    class Response
      def initialize(response)
        @response = response 
      end

      def success? 
        parsed_response[:errors].nil? 
      end

      private
      
      def parsed_response
        JSON.parse(@response.body) 
      end
    end
  end
end
