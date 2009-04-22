class ApplicationConfig::DataStructures::NestedHash < Hash
  
  def initialize(hash = {})
    self.update(hash)
  end
  
  def [](key)
    value = fetch(key, nil)
    return ApplicationConfig::DataStructures::AlwaysNullNode.new unless value
    return ApplicationConfig::DataStructures::ValueNode.new(value) unless value.kind_of?(Hash)
    return ApplicationConfig::DataStructures::NestedHash.new(value)
  end
  
  def method_missing(method_name)
    self[method_name.to_s]
  end
  
end
