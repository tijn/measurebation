require 'rake'
require 'rake/gempackagetask'
require 'rubygems'
require "bundler/setup"
require 'rspec/core/rake_task'

task :default => :spec

def flog(output, *directories)
  system("find #{directories.join(" ")} -name \\*.rb | xargs flog")
end

desc "Analyze code complexity."
task :flog do
  flog "lib", "lib"
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = FileList["#{File.dirname(__FILE__)}/spec/*_spec.rb"]
  t.rspec_opts = ["--colour", "--format documentation"]
end

gem_spec = eval(File.read('measurebation.gemspec'))
Rake::GemPackageTask.new(gem_spec) do |pkg|
  pkg.need_tar_bz2 = true
  pkg.need_zip = true
  pkg.need_tar = true
end
