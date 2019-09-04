# Add simplecov
require "minitest"
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# require_relative your lib files here!
require_relative "../lib/hotel"

describe "hotel test" do
    it "testing" do
        hotel = Hotel.new(1, "name")
        expect(hotel.id).must_equal 1
    end
end
