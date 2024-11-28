
ENV["RAILS_ENV"] ||= "test"

require "simplecov"
SimpleCov.start "rails" do
  command_name "Job #{ENV["TEST_ENV_NUMBER"]}" if ENV["TEST_ENV_NUMBER"]

  if ENV["RECORD_RUNTIME"]
    formatter SimpleCov::Formatter::SimpleFormatter
  else
    formatter SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::SimpleFormatter,
      SimpleCov::Formatter::HTMLFormatter
    ])
  end

  track_files "**/*.rb"
end

require_relative "../config/environment"
require "rails/test_help"
require "parallel_tests/test/runtime_logger" if ENV["RECORD_RUNTIME"]

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    # parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
