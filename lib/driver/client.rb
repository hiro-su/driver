module Driver
  class Client
    class << self
      def const_missing(name)
        name
      end

      def drive(*modules)
        # api
        autoload :API, "#{self}/api".underscore

        modules.each_with_index do |m, i|
          # client
          autoload m, "#{self}::#{m}".underscore

          modules[i] = "#{self}::#{m}".constantize
        end

        include *modules
      end

      def model(*modules)
        modules.each_with_index do |m, i|
          # model
          module_name = self.to_s.sub("::#{self.to_s.demodulize}", '').constantize
          module_name.autoload m, "#{self}::Model::#{m}".underscore
        end

        Driver::Model.concerns
      end
    end

    attr_reader :api

    def initialize(api)
      @api = api
    end
  end
end
