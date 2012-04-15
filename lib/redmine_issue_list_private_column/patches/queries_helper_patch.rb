module RedminePrivateColumn
  module Patches
    module QueriesHelperPatch
      
      def column_content_with_is_private(column, issue)
        value = column.value(issue)
        #is_private?
      end

      def self.included(klass)
        klass.send :alias_method_chain, :column_content, :is_private
      end
      
    end
  end
end