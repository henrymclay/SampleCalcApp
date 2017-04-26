require 'rspec'
require_relative '../helpers/samplecalc.rb'

include SampleCalc
include Math

describe "Pitch calculator" do
  it 'shifts up an octave' do
    shift_up = SampleCalc.pitch_for_target_bpm(4, 120, 4, 240)
    expect(shift_up).to eq(12.00)
  end
  it 'shifts up an half an octave' do
    shift_up = SampleCalc.pitch_for_target_bpm(4, 120, 4, 180)
    expect(shift_up).to eq(7.02)
  end
  it 'shifts down an octave' do
    shift_up = SampleCalc.pitch_for_target_bpm(4, 120, 4, 60)
    expect(shift_up).to eq(-12.00)
  end
  it 'shifts down half an octave' do
    shift_up = SampleCalc.pitch_for_target_bpm(4, 120, 4, 90)
    expect(shift_up).to eq(-4.98)
  end
end
