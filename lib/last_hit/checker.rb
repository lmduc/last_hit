require 'last_hit/file_filter'

class LastHit
  module Checker
    def self.check(files)
      test_files = FileFilter::Spec.filter(files)
      ruby_files = FileFilter::Ruby.filter(files)
      results = filter(ruby_files, test_files)
      if results.length > 0
        $stdout.puts 'There are some changed files without tests'
        results.each { |r| $stdout.puts r }
      else
        $stdout.puts 'No changed files without tests'
      end
    end

    private

    def self.filter(ruby_files, test_files)
      ruby_files.select do |file|
        not_contain?(file, test_files)
      end
    end

    def self.not_contain?(file, test_files)
      test_name = get_test_name(file)
      test_files.each do |test_file|
        return false if test_file.include?(test_name)
      end
      true
    end

    def self.get_test_name(file)
      file.gsub('.rb', '_spec.rb').split('/').last(2).join('/')
    end
  end
end
