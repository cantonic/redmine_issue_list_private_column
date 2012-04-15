module RedminePrivateColumn
  class ViewHooks < Redmine::Hook::ViewListener
    render_on :view_issues_index_bottom, :partial => 'hooks/redmine_issue_list_private_column/view_issues_index_bottom'
  end
end