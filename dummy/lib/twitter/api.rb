module Twitter
  class Client
    class API < Driver::API
      driver Database

      def initialize(apikey, secret, options = {})
        @apikey = apikey
        @secret = secret
        @options = options
      end

      attr_accessor :apikey, :secret, :options
    end
  end
end
