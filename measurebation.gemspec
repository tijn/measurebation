Gem::Specification.new do |s|
  s.name = %q{measurebation}
  s.version = "0.0.3"
  s.date = %q{2010-10-17}
  s.authors = ["Tijn Schuurmans"]
  s.email = %q{tijn@soocial.com}
  s.summary = %q{simple measurement tools for Ruby objects}
  s.description = %q{simple measurement tools for Ruby objects}
  s.add_dependency ("ruby-prof")
  s.files = FileList.new do |fl|
    fl.include("{lib}/**/*")
  end
end

