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

gem_spec = eval(File.read('measurebation.gemspec'))
Rake::GemPackageTask.new(gem_spec) do |pkg|
  pkg.need_tar_bz2 = true
  pkg.need_zip = true
  pkg.need_tar = true
end

