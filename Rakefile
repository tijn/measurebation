require 'rake'
require 'rake/gempackagetask'
require 'rubygems'

def flog(output, *directories)
  system("find #{directories.join(" ")} -name \\*.rb | xargs flog")
end

desc "Analyze code complexity."
task :flog do
  flog "lib", "lib"
end

gem_spec = Gem::Specification.new do |s|
  s.name = %q{measurebation}
  s.version = "0.0.1"
  s.date = %q{2010-06-12}
  s.authors = ["Tijn Schuurmans"]
  s.email = %q{tijn@soocial.com}
  s.summary = %q{simple measurement tools for Ruby objects}
  s.description = %q{simple measurement tools for Ruby objects}
  s.add_dependency ("ruby-prof")
  s.files = FileList.new do |fl|
    fl.include("{lib}/**/*")
  end
end

Rake::GemPackageTask.new(gem_spec) do |pkg|
  pkg.need_tar_bz2 = true
  pkg.need_zip = true
  pkg.need_tar = true
end

