module Twitter
  class Database < Driver::Model
    def initialize(api)
      super(api)
    end

    def delete
      @api.create_database("testdb")
    end
  end
end
