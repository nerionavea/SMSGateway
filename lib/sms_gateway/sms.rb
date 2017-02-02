require 'ostruct' 

module SMSGateway
  class SMS
    attr_accessor :message, :number, :user, :device
    def initialize(*args) 
      @message = args[0][:message] 
      @number = args[0][:number] 
    end

    def valid? 
      message_is_valid? && number_is_valid? && user_is_valid? 
    end

    def set_user(*args) 
      @user = OpenStruct.new(email: args[0][:email], password: args[0][:password]) 
    end

    def deliver(*args) 
      gateway.send_sms(self)
    end

    private

    def gateway
      SMSGateway::Gateway.new() 
    end

    def user_is_valid? 
      !@user.email.nil? && !@user.password.nil?
    end

    def number_is_valid? 
      true if Float(@number) rescue false
    end

    def message_is_valid? 
      !message.nil? && message != "" 
    end
  end
end
