module Twitter
  class Client < Driver::Controller
    drive Database

    def initialize(apikey, secret, options = {})
      @apikey = apikey
      @secret = secret

      binding.pry
      @api = API.new(@apikey, @secret)
    end

    attr_reader :apikey, :secret
  end
end