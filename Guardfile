# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :rspec do
  watch('Gemfile')
  watch('Gemfile.lock')
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})            { |m| "spec/#{m[1]}_spec.rb" }
  logger :level       => :warn
end


