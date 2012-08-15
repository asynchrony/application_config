require 'test_helper'

class AppConfigTest < MiniTest::Unit::TestCase
  def test_empty_config_allows_nils
    ac = ApplicationConfig::Base.new

    assert_not_NIL(ac.property)
    assert_nil(ac.property)
  end

  def test_root_value_node_equal_string
    ac = ApplicationConfig::Base.new
    ac.add("""node: value""")

    assert("value" == ac.node, "expected #{"value"} to == #{ac.node}")
  end

  def test_root_value_node_equal_interpreted_string
    ac = ApplicationConfig::Base.new
    ac.add("""node: value""")

    assert("value" == "#{ac.node}", "expected #{"value"} to == #{"#{ac.node}"}")
  end

  def test_root_value_node_equal_string_concat
    ac = ApplicationConfig::Base.new
    ac.add("""node: value""")

    assert("value" == "" + ac.node, "expected #{"value"} to == #{"" + ac.node}}")
  end

  def test_non_root_value_node_equal_string
    ac = ApplicationConfig::Base.new
    ac.add("""
root:
  node: value
"""
    )

    assert("value" == ac.root.node, "expected #{"value"} to == #{ac.root.node}")
  end

  def test_non_root_value_node_to_s_equal_to_string
    ac = ApplicationConfig::Base.new
    ac.add("""
root:
  node: value
"""
    )

    assert_equal("value", ac.root.node.to_s)
  end

  def test_non_root_value_node_equal_interpreted_string
    ac = ApplicationConfig::Base.new
    ac.add("""
root:
  node: value
"""
    )

    assert("value" == "#{ac.root.node}", "expected #{"value"} to == #{"#{ac.root.node}"}")
  end

  def test_non_root_value_node_equal_string_concat
    ac = ApplicationConfig::Base.new
    ac.add("""
root:
  node: value
"""
    )

    assert("value" == "" + ac.root.node, "expected #{"value"} to == #{"" + ac.root.node}")
  end

  def test_non_root_value_node_case_statement
    ac = ApplicationConfig::Base.new
    ac.add("""
root:
  node: value
"""
    )

    case ac.root.node
    when String
      pass("Woot!")
    else
      fail("Should have evaluated as string")
    end
  end

  def test_non_root_value_node_fixnum_value
    ac = ApplicationConfig::Base.new
    ac.add("""
root:
  node: 5
""")

      assert_equal(5, ac.root.node)
  end

  def test_numeric_value_node_returns_null_node_on_missing_value
    out = ApplicationConfig::DataStructures::NumericValueNode.new(5)
    assert_equal(5, out)
    assert_nil(out.monkeys)
    assert_nil(out.monkeys.monkeys)
  end

  def test_numeric_value_node_to_s_returns_correct_string
    out = ApplicationConfig::DataStructures::NumericValueNode.new(5)
    assert_equal("5", out.to_s)
  end

  def test_string_value_node_returns_null_node_on_missing_value
    out = ApplicationConfig::DataStructures::StringValueNode.new("hi")
    assert_equal("hi", out)
    assert_nil(out.monkeys)
    assert_nil(out.monkeys.monkeys)
  end
end
