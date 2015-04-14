module Twitter
  class Database < Driver::Model
    def create(name)
      @api.create_database(name)
    end

    def delete(name)
      @api.hoge(name)
    end
  end
end
