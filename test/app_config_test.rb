require 'test_helper'

class AppConfigTest < MiniTest::Unit::TestCase
  def test_empty_config_allows_nils
    ac = ApplicationConfig::Base.new

    assert_not_NIL(ac.property)
    assert_nil(ac.property)
  end

  def test_value_node_is_string
    ac = ApplicationConfig::Base.new
    ac.add("""key: value""")

    assert_equal("value", ac.key)
  end

  def test_value_node_equal_intereted_string
    ac = ApplicationConfig::Base.new
    ac.add("""key: value""")

    assert_equal("value", "#{ac.key}")
  end

  def test_value_node_equal_string_concat
    ac = ApplicationConfig::Base.new
    ac.add("""key: value""")
    
    assert_equal("value", "" + ac.key)
  end
end
