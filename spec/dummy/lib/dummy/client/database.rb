module Dummy
  class Client
    module Database
      def db
        Dummy::Database.new(@api)
      end
    end
  end
end
