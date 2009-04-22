require 'forwardable'
class ApplicationConfig::DataStructures::ValueNode
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
