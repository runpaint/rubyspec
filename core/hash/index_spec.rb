require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/classes'

describe "Hash#index" do
  it "returns the corresponding key for value" do
    new_hash(2 => 'a', 1 => 'b').index('b').should == 1
  end

  it "returns nil if the value is not found" do
    new_hash(:a => -1, :b => 3.14, :c => 2.718).index(1).should == nil
  end

  it "doesn't return default value if the value is not found" do
    new_hash(5).index(5).should == nil
  end

  it "compares values using ==" do
    new_hash(1 => 0).index(0.0).should == 1
    new_hash(1 => 0.0).index(0).should == 1

    needle = mock('needle')
    inhash = mock('inhash')
    inhash.should_receive(:==).with(needle).and_return(true)

    new_hash(1 => inhash).index(needle).should == 1
  end
end
