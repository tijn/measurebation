module Measurebation

  # How to use:
  # h = Histogram.new(0..10_000, 100)
  # h.count(141)
  # h.count(2621)
  # ...
  # h.to_s

  class Histogram
    attr_reader :range, :binsize, :bins, :smaller, :bigger
    attr_accessor :caption

    def initialize(range, binsize, options = {})
      @caption = options[:caption] || ""
      @range = range
      @binsize = binsize.to_i

      @bins = Array.new(@range.last/@binsize, 0)
      @smaller = 0
      @bigger = 0
    end

    def count(num)
      if num < @range.first
        @smaller += 1
      elsif num > @range.last
        @bigger += 1
      else
        @bins[(num - @range.first)/@binsize] += 1
      end
    end

    def to_a
      a = []
      a << ["< #{@range.first}", @smaller]
      @bins.each_with_index do |value, index|
        a << ["#{index*@binsize}-#{index*@binsize+@binsize-1}", value]
      end
      a << ["> #{@range.last}", @bigger]
      a
    end

    def to_s
      require 'faster_csv'
      csv_string = FasterCSV.generate do |csv|
        csv << @caption
        to_a.each { |line| csv << line }
      end
    end

  end
end
