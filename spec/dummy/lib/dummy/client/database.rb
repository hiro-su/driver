module Dummy
  class Client
    model Database, DatabaseCollection

    module Database
      def db
        Dummy::Database.new(@api)
      end

      def dbs
        Dummy::DatabaseCollection.new(@api)
      end
    end
  end
end
