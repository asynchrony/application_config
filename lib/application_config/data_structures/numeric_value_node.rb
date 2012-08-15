require 'delegate'
module ApplicationConfig
  module DataStructures
    class NumericValueNode < DelegateClass(Numeric)

      def [](key)
        ApplicationConfig::DataStructures::AlwaysNullNode.new
      end
      
      def method_missing(method_name)
        return ApplicationConfig::DataStructures::AlwaysNullNode.new
      end
    end
  end
end