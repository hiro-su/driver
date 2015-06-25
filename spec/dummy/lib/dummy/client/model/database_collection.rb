module Dummy
  class DatabaseCollection < Driver::Model
    include Enumerable

    def each
      @api.list_database.each do |db|
        yield db
      end
    end
  end
end
