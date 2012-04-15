module RedminePrivateColumn
  module Patches
    module QueriesHelperPatch
      
      def column_content_with_is_private(column, issue)
				if column.value(issue) == true
					value = image_tag('true.png')
				else
					value = image_tag('false.png')
				end
      end

      def self.included(klass)
        klass.send :alias_method_chain, :column_content, :is_private
      end
      
    end
  end
end