# frozen_string_literal: true

module Clocked
  class Stopwatch
    Lap = Struct.new(:name, :start_time, :end_time) do
      def elapsed
        end_time - start_time
      end

      def to_s
        "#{name}: #{elapsed}s"
      end
    end

    attr_reader :name, :laps, :start_time

    # Create a new stopwatch.
    # @param name [String] an optional name for this stopwatch
    # @return [Stopwatch]
    def initialize(name = nil)
      @name = name
      @start_time = now
      @laps = []
    end

    # Determine how much time has elapsed since the creation of this stopwatch.
    # @return [Float]
    def elapsed
      now - start_time
    end

    # Mark the completion of a lap.
    # @param name [String] an optional name for the newly marked lap
    def mark_lap(name = nil)
      laps << Lap.new(
        name || "Lap #{laps.count + 1}",
        laps.last&.end_time || start_time,
        now
      )
    end

    # Generate a string-representation of the stopwatch and any laps.
    # @return [String]
    def to_s
      text = [name, "#{elapsed}s"].compact.join(": ")
      text += " (#{laps.map(&:to_s).join(", ")})" unless laps.empty?
      text
    end

    private

    def now
      Time.now
    end
  end
end
