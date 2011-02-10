require 'forwardable'
module ApplicationConfig
  module DataStructures
    class ValueNode
      extend Forwardable
      def_delegators :@value, :eql?, :==, :to_s, :to_str, :to_i
      
      def initialize(value)
        @value = value
      end
      
      def [](key)
        ApplicationConfig::DataStructures::AlwaysNullNode.new
      end
      
      def method_missing(method_name)
        ApplicationConfig::DataStructures::AlwaysNullNode.new
      end
    end
  end
end
