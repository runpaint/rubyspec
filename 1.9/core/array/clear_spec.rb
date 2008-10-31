require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/classes'

describe "Array#clear" do
  it "removes all elements" do
    a = [1, 2, 3, 4]
    a.clear.should equal(a)
    a.should == []
  end  

  it "returns self" do
    a = [1]
    oid = a.object_id
    a.clear.object_id.should == oid
  end

  it "leaves the Array empty" do
    a = [1]
    a.clear
    a.empty?.should == true
    a.size.should == 0
  end

  it "keeps taint status" do
    a = [1]
    a.taint
    a.tainted?.should be_true
    a.clear
    a.tainted?.should be_true
  end

  it "keeps untrusted status" do
    a = [1]
    a.untrust
    a.untrusted?.should be_true
    a.clear
    a.untrusted?.should be_true
  end

  compliant_on :ruby, :jruby do
    it "raises a RuntimeError on a frozen array" do
      a = [1]
      a.freeze
      lambda { a.clear }.should raise_error(RuntimeError)
    end
  end
end