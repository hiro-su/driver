module Driver
  class Model
    class << self
      def method_missing(method)
        module_path = File.join(
          caller[1].split('/')[0..-2].join('/'),
          'model',
          method.to_s
        )

        Dir[File.join(module_path, '/**/*.rb')].each do |m|
          require m
        end
      end
    end

    def initialize(api)
      @api = api
    end
  end
end
