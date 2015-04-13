module Twitter
  class Client
    module Database
      def db
        Twitter::Database.new(@api)
      end

      def db2
        @api.create_database("fugadb")
      end
    end
  end
end
