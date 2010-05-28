module Measurebation

  def self.profile!(options = {})
    require 'ruby-prof'
    raise "profile what?!" unless block_given?
    options[:filename] ||= 'profile.html'
    puts 'start profiling...'
    RubyProf.start
    x = yield
    result = RubyProf.stop
    printer = RubyProf::GraphHtmlPrinter.new(result)
    puts "writing profile to '#{options[:filename]}'"
    printer.print(File.open(options[:filename], "w"))
    exit if options[:exit_after_first_run]
    x
  end

  def self.memprof!(options = {})
    require 'memprof'
    raise "profile what?!" unless block_given?
    puts 'start profiling...'
    Memprof.start
    x = yield
    result = Memprof.stop
    puts memprof.stats
    exit if options[:exit_after_first_run]
    x
  end

end
