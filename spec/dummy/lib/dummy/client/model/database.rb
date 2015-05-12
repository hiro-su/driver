module Dummy
  class Database < Driver::Model
    def create(name)
      @api.create_database(name)
    end

    def delete(name)
      @api.drop_table(name)
    end
  end
end
