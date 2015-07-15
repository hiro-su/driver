module Dummy
  class Client::API
    module Table
      def create_table(name)
        "#{__method__}: #{name}"
      end

      def drop_table(name)
        "#{__method__}: #{name}"
      end
    end
  end
end
