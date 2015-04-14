module Driver
  class Controller
    class << self
      def const_missing(name)
        name
      end

      def drive(*modules)
        @dir ||= File.dirname(__FILE__)

        # api
        autoload :API, "#{self}/api".underscore

        modules.each_with_index do |m, i|
          # controller
          hoge = "#{self}::#{m}".underscore

          autoload m, "#{self}::#{m}".underscore

          # model
          module_name = self.to_s.sub("::#{self.to_s.demodulize}", '').constantize
          module_name.autoload m, "#{self}::Model::#{m}".underscore

          modules[i] = "#{self}::#{m}".constantize
        end

        include *modules
      end

      def basedir(dir)
        @dir = dir
      end
    end

    attr_reader :api

    def initialize(api)
      @api = api
    end
  end
end
