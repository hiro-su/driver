module Twitter
  class DatabaseCollection < Model
    def initialize(@api)
      p "model DatabaseCollection: #{@api}"
    end
  end
end
