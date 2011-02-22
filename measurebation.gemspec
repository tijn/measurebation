Gem::Specification.new do |s|
  s.name = %q{measurebation}
  s.version = "0.0.5"
  s.date = %q{2010-10-20}
  s.authors = ["Tijn Schuurmans"]
  s.email = %q{tijn@soocial.com}
  s.summary = %q{simple measurement tools for Ruby objects}
  s.description = %q{simple measurement tools for Ruby objects}
  s.add_dependency("ruby-prof")
  s.add_dependency("memprof")
  s.add_dependency("fastercsv")
  s.files = Dir["lib/**/*"]
end

