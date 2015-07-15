#require File.join(File.dirname(__FILE__), 'concerns/table')

module Dummy
  class Database < Driver::Model
    def create(name)
      @api.create_database(name)
    end

    def delete(name)
      @api.drop_database(name)
    end

    def table
      Dummy::Database::Table.new(@api)
    end
  end
end
