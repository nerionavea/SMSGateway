module SMSGateway
  class SMS
    attr_accessor :message, :number
    def initialize(*args) 
      @message = args[0][:message] 
      @number = args[0][:number] 
    end

    def valid? 
      message_is_valid? && number_is_valid? 
    end

    private

    def number_is_valid? 
      true if Float(@number) rescue false
    end

    def message_is_valid? 
      !message.nil? && message != "" 
    end
  end
end
