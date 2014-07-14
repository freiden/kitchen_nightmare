# encoding: utf-8

module RuboCop
  module Cop
    # An offense represents a style violation detected by RuboCop.
    class Offense
      include Comparable

      # @api public
      #
      # @!attribute [r] severity
      #
      # @return [RuboCop::Cop::Severity]
      attr_reader :severity

      # @api public
      #
      # @!attribute [r] location
      #
      # @return [Parser::Source::Range]
      #   the location where the violation is detected.
      #
      # @see http://rubydoc.info/github/whitequark/parser/Parser/Source/Range
      #   Parser::Source::Range
      attr_reader :location

      # @api public
      #
      # @!attribute [r] message
      #
      # @return [String]
      #   human-readable message
      #
      # @example
      #   'Line is too long. [90/80]'
      attr_reader :message

      # @api public
      #
      # @!attribute [r] cop_name
      #
      # @return [String]
      #   a cop class name without namespace.
      #   i.e. type of the violation.
      #
      # @example
      #   'LineLength'
      attr_reader :cop_name

      # @api public
      #
      # @!attribute [r] corrected
      #
      # @return [Boolean]
      #   whether this offense is automatically corrected.
      attr_reader :corrected
      alias_method :corrected?, :corrected

      # @api private
      attr_reader :line

      # @api private
      attr_reader :column

      # @api private
      def initialize(severity, location, message, cop_name, corrected = false)
        @severity = RuboCop::Cop::Severity.new(severity)
        @location = location.freeze
        @line = location.line.freeze
        @column = location.column.freeze
        @message = message.freeze
        @cop_name = cop_name.freeze
        @corrected = corrected.freeze
        freeze
      end

      # @api private
      # This is just for debugging purpose.
      def to_s
        format('%s:%3d:%3d: %s',
               severity.code, line, real_column, message)
      end

      # @api private
      #
      # Internally we use column number that start at 0, but when
      # outputting column numbers, we want them to start at 1. One
      # reason is that editors, such as Emacs, expect this.
      def real_column
        column + 1
      end

      # @api public
      #
      # @return [Boolean]
      #   returns `true` if two offenses contain same attributes
      def ==(other)
        severity == other.severity && line == other.line &&
          column == other.column && message == other.message &&
          cop_name == other.cop_name
      end

      # @api public
      #
      # Returns `-1`, `0` or `+1`
      # if this offense is less than, equal to, or greater than `other`.
      #
      # @return [Integer]
      #   comparison result
      def <=>(other)
        [:line, :column, :cop_name, :message].each do |attribute|
          result = send(attribute) <=> other.send(attribute)
          return result unless result == 0
        end
        0
      end
    end
  end
end
