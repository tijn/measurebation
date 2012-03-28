# This module stores a hash in your object called @measurements.
module Measurebation

  def self.included(base)
    base.extend(ClassMethods)
  end

  def measurements
    @measurements ||= {}
  end

  def log_measurement!(name, value)
    measurements[name.to_sym] = value
  end

  def measure_time(name, &block)
    starting_time = Time.now
    result = yield
    processing_time = Time.now - starting_time
    log_measurement!(name, processing_time)
    result
  end

  def measure_time_and_warn(s, logger, &block)
    t0 = Time.now
    x = yield
    t = Time.now - t0
    logger.warn "\"Measurebation\", \"#{s}\", #{"%.2f" % t}" # should be easy to output to csv.
    x
  end

  def time_measures
    @time_measures ||= {}
  end

  def start_time_measure(name)
    time_measures[name.to_sym] = Time.now
  end

  def stop_time_measure(name)
    starting_time = time_measures[name.to_sym]
    # rescue will have the effect that we don't log anything, normally I'd say fail early and hard, but logging is less important than processing the messages
    processing_time = Time.now - starting_time rescue nil
    log_measurement!(name, processing_time)
  end

  module ClassMethods

    def measure_time(*method_names)
      method_names.each { |method_name| measure_method_time(method_name) }
    end

    # decorator for methods
    def measure_method_time(method_name)
      old_method = instance_method(method_name)

      define_method(method_name) do |*args|
        measure_time(method_name) do
          old_method.bind(self).call(*args)
        end
      end
    end
  end

end
