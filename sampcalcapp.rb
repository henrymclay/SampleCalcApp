require_relative './helpers/samplecalc.rb'

include SampleCalc
include Math

#script describes different operations to begin
puts "Welcome to SampleCalc!"
puts "(1) Calculate length in samples for a number of beats?"
puts "(2) Calculate length in samples for a time duration?"
puts "(3) Calculate semitones to pitch a sample to a duration?"
puts "1 , 2 , 3 ? (any other key to quit)"
usr_choice = $stdin.gets.chomp

# case statement based on int selection - any other response quits program

case usr_choice
when "1"
  # script to ask user for variables
  puts "This program will calculate the length in samples for a given beat duration at a given tempo"
  puts "How many quarter notes we talkin here? (Duration)"
  @qnotes = $stdin.gets.chomp.to_f
  puts "How many beats per minute? (Tempo)"
  @bpm = $stdin.gets.chomp.to_i
  puts "Whats the sample rate in khz? (Default 44100)"
  @sr = $stdin.gets.chomp

  # calculations w/ supplied variables, default option
  if @sr =~ /([0-9])\w+/
    @sr.to_i
    puts "Trim to #{SampleCalc.samples_per_beats(@qnotes, @bpm, @sr).to_i} samples"
  else
    @sr = 44100
    puts "Trim to #{SampleCalc.samples_per_beats(@qnotes, @bpm, @sr).to_i} samples"
  end

when "2"
  #script to ask user for variables
  puts "This program will calculate the length in samples for a given time in seconds"
  puts "How many seconds long is it?"
  @time = $stdin.gets.chomp.to_i
  puts "Whats the sample rate in khz? (Default 44100)"
  @sr = $stdin.gets.chomp
  #calculate using variables, samples_per_time method
  if @sr =~ /([0-9])\w+/
    @sr.to_i
    puts "Trim to #{SampleCalc.samples_per_time(@time, @sr).to_i} samples"
  else
    @sr = 44100
    puts "Trim to #{SampleCalc.samples_per_time(@time, @sr).to_i} samples"
  end

when "3"
  # script to ask user for variables
  puts "This program will tell you how many semitones to go from a sample at one tempo and duration (in beats) to another tempo and duration (in beats)"
  puts "What's the sample's initial tempo?"
  @tempo1 = $stdin.gets.chomp.to_i
  puts "How many beats is the initial sample?"
  @beats1 = $stdin.gets.chomp.to_i
  puts "What's the target tempo?"
  @tempo2 = $stdin.gets.chomp.to_i
  puts "How many beats should it be? (Default: same as initial)"
  @beats2 = $stdin.gets.chomp.to_i
  # calculate using variables, pitch_for_target_bpm method
  if @beats2 =~ /([0-9])\w+/
    @beats2.to_i
    puts "#{SampleCalc.pitch_for_target_bpm(@time, @sr).to_i} semitones"
  else
    @beats2 = @beats1
    puts "#{SampleCalc.pitch_for_target_bpm(@beats1, @tempo1, @beats2, @tempo2).to_i} semitones"
  end

else
  puts "Later!"
end
