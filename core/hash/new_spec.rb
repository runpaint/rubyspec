require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/classes'

describe "Hash.new" do
  it "creates a new Hash with default object if pass a default argument " do
    hash_class.new(5).default.should == 5
    hash_class.new(new_hash).default.should == new_hash
  end

  it "does not create a copy of the default argument" do
    str = "foo"
    hash_class.new(str).default.should equal(str)
  end

  it "creates a Hash with a default_proc if passed a block" do
    hash_class.new.default_proc.should == nil

    h = hash_class.new { |x| "Answer to #{x}" }
    h.default_proc.call(5).should == "Answer to 5"
    h.default_proc.call("x").should == "Answer to x"
  end

  it "raises an ArgumentError if more than one argument is passed" do
    lambda { hash_class.new(5,6) }.should raise_error(ArgumentError)
  end

  it "raises an ArgumentError if passed both default argument and default block" do
    lambda { hash_class.new(5) { 0 }   }.should raise_error(ArgumentError)
    lambda { hash_class.new(nil) { 0 } }.should raise_error(ArgumentError)
  end
end
