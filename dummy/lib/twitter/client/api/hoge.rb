module Twitter
  class Client::API
    module Hoge
      def hoge(name)
        "#{__method__}: #{name}"
      end
    end
  end
end
