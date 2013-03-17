require_relative '../../test_helper'

describe Manywords do

  it "must be versioned" do
    Manywords::VERSION.wont_be_nil
  end

end

