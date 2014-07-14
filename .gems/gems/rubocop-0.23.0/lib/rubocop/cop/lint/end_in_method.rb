# encoding: utf-8

module RuboCop
  module Cop
    module Lint
      # This cop checks for END blocks in method definitions.
      class EndInMethod < Cop
        include CheckMethods

        MSG = '`END` found in method definition. Use `at_exit` instead.'

        private

        def check(node, *_)
          on_node(:postexe, node) do |end_node|
            add_offense(end_node, :keyword)
          end
        end
      end
    end
  end
end
