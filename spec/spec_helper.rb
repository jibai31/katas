# http://www.drdobbs.com/architecture-and-design/dave-thomas-interview-the-corruption-of/240166688
# http://codekata.com/kata/kata01-supermarket-pricing/

$: << "." << File.join(File.dirname(__FILE__), "..", "lib")
#$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rspec'

RSpec.configure do |config|
  config.mock_with :rspec

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

end

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each {|f| require f}
