require 'rspec/core'
require 'rspec/core/formatters/base_text_formatter'

module RSpec
  module PrintFailuresAsEmoji
    class Formatter
      RSpec::Core::Formatters.register self, :example_failed, :example_passed

      def initialize(output)
        @output = output
        @last_failure_index = 0
      end

      def example_failed(notification)
        @output.print '😡 '
      end

      def example_passed(notification)
        @output.print '😃 '
      end
    end
    module SilenceDumpFailures
      def dump_failures(_notification)
      end

      RSpec::Core::Formatters::BaseTextFormatter.prepend(self)
    end
  end
end
