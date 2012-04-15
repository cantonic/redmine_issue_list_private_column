module RedminePrivateColumn
  module Patches
    module QueryPatch
      
      def available_columns_with_is_private
        returning available_columns_without_is_private do |columns|

            columns << QueryColumn.new(:is_private,
              :caption => :field_is_private
            ) unless columns.detect{ |c| c.name == :is_private }

        end
      end

      def self.included(klass)
        klass.send :alias_method_chain, :available_columns, :is_private
      end
      
    end
  end
end