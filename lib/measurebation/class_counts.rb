require 'pp'

module Measurebation

  # copied from trevorturk (http://twitter.com/trevorturk)
  # http://flowcoder.com/193 - Quick and dirty memory profiling

  # returns a hash with the number of instances (values) per class (keys)
  def self.class_counts
    counts = Hash.new 0
    ObjectSpace.each_object do |o|
      counts[o.class] += 1
    end
    counts
  end

  def self.print_class_counts
    pp class_counts.sort_by { |k,v| v }.reverse
  end

end

