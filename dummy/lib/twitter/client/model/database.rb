module Twitter
  class Database < Driver::Model
    def create(name)
      @api.create_database(name)
    end
  end
end
