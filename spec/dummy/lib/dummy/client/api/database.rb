module Dummy
  class Client::API
    module Database
      def create_database(name)
        "#{__method__}: #{name}"
      end

      def list_database
        ["db1", "db2", "db3"]
      end
    end
  end
end
