# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'spork', :rspec_port => 5614 do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
  watch(%r{^spec/support/.+\.rb$})
end




guard 'rspec', :cli => "--drb --drb-port 5614" do
  watch(%r{^spec/.+_spec\.rb$}) { "spec" } 
  watch(%r{^lib/(.+)\.rb$})   { "spec" } # { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.treetop$})   { "spec" }
  watch(%r{^lib/(.+)\.csv$})   { "spec" }
  #watch(%r{^spec/support/(.+)\.rb$})   { "spec" }
  watch('spec/spec_helper.rb')  { "spec" }
  watch(%r{^app/(.+)\.rb$})   { "spec" }
end





