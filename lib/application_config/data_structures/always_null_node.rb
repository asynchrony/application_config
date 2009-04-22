class ApplicationConfig::DataStructures::AlwaysNullNode
  
  def initialize
    
  end
  
  def nil?
    return true
  end
  
  def to_s
    ""
  end
  
  def ==(other)
    other == nil
  end
  
  def eql?(other)
    other.eql?(nil)
  end
  
  def [](key)
    ApplicationConfig::DataStructures::AlwaysNullNode.new
  end
  
  def method_missing(method)
    ApplicationConfig::DataStructures::AlwaysNullNode.new
  end
  
end
