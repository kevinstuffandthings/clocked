# frozen_string_literal: true

module Clocked
  describe Stopwatch do
    describe "#elapsed" do
      let(:duration) { 1.2 }

      it "can provide a simple summary of what it timed" do
        sw = described_class.new
        sleep duration
        expect(sw.elapsed).to be_within(0.05).of(duration)
      end

      it "builds based on #now" do
        expect(Time).to receive(:now).and_return(18, 47, 96, 98)
        expect(subject.elapsed).to eq(47 - 18)
        expect(subject.elapsed).to eq(96 - 18)
        expect(subject.to_s).to eq "80s"
      end
    end

    describe "#mark_lap" do
      subject { described_class.new("My routine") }
      before(:each) { allow(Time).to receive(:now).and_return(12, 19, 35, 52, 83, 85) }

      it "can mark a variety of laps, with and without names" do
        subject.mark_lap
        subject.mark_lap("thing")
        subject.mark_lap("stuff")
        subject.mark_lap

        expect(subject.laps.count).to eq 4
        subject.laps.each { |l| expect(l).to be_a described_class::Lap }

        expect(subject.to_s).to eq "My routine: 73s (Lap 1: 7s, thing: 16s, stuff: 17s, Lap 4: 31s)"
      end
    end
  end
end
