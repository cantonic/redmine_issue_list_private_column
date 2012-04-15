module RedminePrivateColumn
  module Patches
    module QueriesHelperPatch
      
      def column_content_with_is_private(column, issue)
				value = column.value(issue)
				if column.name == :is_private
					if issue.is_private?
						value = image_tag('true.png')
					else
						value = image_tag('false.png')
					end
				else
					column_content_without_is_private(column, issue)
				end
      end

      def self.included(klass)
        klass.send :alias_method_chain, :column_content, :is_private
      end
      
    end
  end
end
