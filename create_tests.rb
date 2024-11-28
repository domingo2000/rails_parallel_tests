#!/usr/bin/env ruby

require 'fileutils'

def create_test_file(number)
  content = <<~RUBY
    require 'test_helper'
    require 'active_support/test_case'

    class LoadTest#{number} < ActiveSupport::TestCase
      test "dummy test #{number}" do
        assert_equal 2, 1 + 1
      end
    end
  RUBY

  FileUtils.mkdir_p('test/load')
  File.write("test/load/load_test_#{number}_test.rb", content)
end

# Get the number of tests from command line argument
n = ARGV[0].to_i

if n <= 0
  puts "Please provide a positive number as argument"
  exit 1
end

puts "Creating #{n} test files..."
(1..n).each do |i|
  create_test_file(i)
  puts "Created test/load/load_test_#{i}_test.rb"
end

puts "Done! Created #{n} test files."
