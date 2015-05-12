module Dummy
  class Client < Driver::Client
    drive Database

    def initialize(apikey, secret, options = {})
      @apikey = apikey
      @secret = secret

      @api = API.new(@apikey, @secret)
    end

    attr_reader :apikey, :secret
  end
end
