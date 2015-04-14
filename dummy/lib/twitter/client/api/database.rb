module Twitter
  class Client::API
    module Database
      def create_database(name)
        "#{__method__}: #{name}"
      end
    end
  end
end
