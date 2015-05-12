module Dummy
  class Client::API
    module Table
      def drop_table(name)
        "#{__method__}: #{name}"
      end
    end
  end
end
