module SampleCalc

  include Math

  def samples_per_beats(qnotes, bpm, sr)
    time = qnotes.to_f / bpm.to_f
    seconds = time.to_f * 60
    samples = seconds * sr.to_f
  end

  def samples_per_time(time, sr)
    seconds = time.to_f
    samples = seconds.to_f * sr.to_f
  end

  def pitch_for_target_bpm(qnotes_initial, bpm_initial, qnotes_target, bpm_target)
    initial_time = qnotes_initial.to_f/bpm_initial.to_i
    target_time = qnotes_target.to_f/bpm_target.to_i
    ratio = initial_time/target_time
    semitones = Math.log2(ratio) * 12
    semitones.round(2)
  end

end
