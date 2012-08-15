module ApplicationConfig
  
  module DataStructures
    class NestedHash < Hash
  
      def initialize(hash = {})
        self.update(hash)
      end
      
      def [](key)
        value = fetch(key, nil)
        return ApplicationConfig::DataStructures::AlwaysNullNode.new unless value
        return ApplicationConfig::DataStructures::NestedHash.new(value) if value.kind_of?(Hash)

        case value
        when String
          return ApplicationConfig::DataStructures::StringValueNode.new(value)
        when Numeric
          return ApplicationConfig::DataStructures::NumericValueNode.new(value)
        else
          raise "Unmapped value type: #{value.class.name} for #{value}"
        end
      end
      
      def method_missing(method_name)
        self[method_name.to_s]
      end
    end
  end  
end
