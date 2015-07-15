module Dummy
  class Database
    class Table < Driver::Model
      def create(name)
        @api.create_table(name)
      end

      def delete(name)
        @api.drop_table(name)
      end
    end
  end
end
