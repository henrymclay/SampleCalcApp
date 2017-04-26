require 'rspec'
require_relative '../helpers/samplecalc.rb'

include SampleCalc
include Math

describe "calculates sample time" do
  it '30 seconds at 130 bpm' do
    time2 = SampleCalc.samples_per_time()
    expect(time2).to eq()
  end
  it '30 seconds at 160 bpm' do
    time2 = SampleCalc.samples_per_time()
    expect(time2).to eq()
  end
end
