ENV['RACK_ENV'] ||= 'test'

require 'bundler/setup'
Bundler.require :default, ENV['RACK_ENV']

$LOAD_PATH << 'lib'

%w(lib app).each do |dir|
  path = File.join(File.dirname(__FILE__), '..', dir, '**', '*.rb')
  Dir[path].each { |file| require file }
end
