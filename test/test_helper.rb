$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
require 'application_config'

class MiniTest::Unit::TestCase

  def assert_not_NIL(test)
    assert(test.class.name != "Nil", "expected #{test} to not be nil")
  end

end