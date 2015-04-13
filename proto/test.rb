#require 'active_support/core_ext/object'
require 'active_support/core_ext/string/inflections'

module Driver
  class Controller
    class << self
      def const_missing(name)
        name
      end

      def drive(*modules)
        @dir ||= File.dirname(__FILE__)

        # api
        autoload :API, File.join(@dir, "#{self}/api".underscore)

        modules.each_with_index do |m, i|
          # controller
          autoload m, File.join(@dir, "#{self}::#{m}".underscore)

          # model
          module_name = self.to_s.sub("::#{self.to_s.demodulize}", '').constantize
          module_name.autoload m, File.join(@dir, "#{self}::Model::#{m}".underscore)

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

  class Model
    def initialize(api)
      @api = api
    end
  end

  class API
    class << self
      def const_missing(name)
        name
      end

      def drive(*modules)
        @dir ||= File.dirname(__FILE__)

        modules.each_with_index do |m, i|
          api = "#{self}::#{m.to_s.demodulize}"
          autoload m.to_s.demodulize, File.join(@dir, api.underscore)
          modules[i] = api.constantize
        end

        include *modules
      end
    end
  end
end

module Driver
  refine Controller do
    private 

    def controller
      p "private controller"
    end

    def model
      p "private model"
    end
  end
end

#-----------------
# ↑ フレームワーク
# ↓ デベロッパー
#-----------------

module Twitter
  class Client < Driver::Controller
    drive Database, Table

    def initialize(apikey, secret, options = {})
      @apikey = apikey
      @secret = secret

      @api = API.new(@apikey, @secret)
    end

    attr_reader :apikey, :secret
  end
end

#-----------------
# ↓ ユーザ記述
#-----------------

client = Twitter::Client.new('apikey', 'secret')
p client.db.delete
