require "./spec_helper"

describe Fiber::Pool do
  it "should deplete the queue and add each item to a results accumulator - just tests the external API" do
    results = [] of Int32
    queue = (1..100).to_a
    pool = Fiber::Pool.new(queue, 10)
    pool.run do |item|
      results << item
    end
    results.size.should eq(100)
  end
end
