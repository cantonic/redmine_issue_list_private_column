require 'redmine'
require 'dispatcher'
require 'redmine_issue_list_private_column/hooks'
require 'redmine_issue_list_private_column/patches/issue_patch'
require 'redmine_issue_list_private_column/patches/queries_helper_patch'
require 'redmine_issue_list_private_column/patches/query_patch'

Dispatcher.to_prepare do
  Issue.send(:include, RedminePrivateColumn::Patches::IssuePatch) unless Issue.include?(RedminePrivateColumn::Patches::IssuePatch)
  Query.send(:include, RedminePrivateColumn::Patches::QueryPatch) unless Query.include?(RedminePrivateColumn::Patches::QueryPatch)
  QueriesHelper.send(:include, RedminePrivateColumn::Patches::QueriesHelperPatch) unless QueriesHelper.include?(RedminePrivateColumn::Patches::QueriesHelperPatch)
end

Redmine::Plugin.register :redmine_issue_list_private_column do
  name 'Redmine Issue List Private Column plugin'
  author 'Can Tonic'
  description 'Adds a Private column to issue lists'
  version '0.0.1'
  author_url 'http://www.cantonic.com'
end
