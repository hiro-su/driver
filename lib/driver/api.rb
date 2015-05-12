module Driver
  class API
    class << self
      def const_missing(name)
        name
      end

      def drive(*modules)
        modules.each_with_index do |m, i|
          api = "#{self}::#{m.to_s.demodulize}"
          autoload m.to_s.demodulize, api.underscore
          modules[i] = api.constantize
        end

        include *modules
      end
    end
  end
end
