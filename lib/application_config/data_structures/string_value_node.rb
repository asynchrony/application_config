require 'forwardable'
module ApplicationConfig
  module DataStructures
    class StringValueNode < String
      
      def [](key)
        ApplicationConfig::DataStructures::AlwaysNullNode.new
      end
      
      def method_missing(method_name)
        ApplicationConfig::DataStructures::AlwaysNullNode.new
      end
    end
  end
end