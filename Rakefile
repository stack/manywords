require "bundler/gem_tasks"

require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << 'lib/manywords'
  t.test_files = FileList['test/lib/manywords/*_test.rb']
  t.verbose = true
end

task :default => :test

