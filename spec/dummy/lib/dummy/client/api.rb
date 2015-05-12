module Dummy
  class Client
    class API < Driver::API
     drive Database, Table

      def initialize(apikey, secret, options = {})
        @apikey = apikey
        @secret = secret
        @options = options
      end

      attr_accessor :apikey, :secret, :options
    end
  end
end
