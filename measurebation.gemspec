Gem::Specification.new do |s|
  s.name = %q{measurebation}
  s.version = "0.0.6"
  s.date = %q{2011-06-01}
  s.authors = ["Tijn Schuurmans"]
  s.email = %q{tijn@soocial.com}
  s.summary = %q{simple measurement tools for Ruby objects}
  s.description = %q{simple measurement tools for Ruby objects}
  s.add_dependency("ruby-prof")
#   s.add_dependency("memprof")
  s.requirements << "memprof if your ruby < 1.9"
  s.add_dependency("fastercsv")
  s.files = Dir["lib/**/*"]
end
