module Driver
  class Controller
    class << self
      def const_missing(name)
        name
      end

      def drive(*modules)
        @dir ||= File.dirname(__FILE__)

        # api
        #autoload :API, File.join(@dir, "#{self}/api".underscore)
        autoload :API, "#{self}/api".underscore

        modules.each_with_index do |m, i|
          # controller
          #autoload m, File.join(@dir, "#{self}::#{m}".underscore)
          hoge = "#{self}::#{m}".underscore
          require "pry"
          binding.pry

          autoload m, "#{self}::#{m}".underscore

          # model
          module_name = self.to_s.sub("::#{self.to_s.demodulize}", '').constantize
          #module_name.autoload m, File.join(@dir, "#{self}::Model::#{m}".underscore)
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
