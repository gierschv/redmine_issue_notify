module IssueNotify
  module Hooks
    class ViewsIssuesHook < Redmine::Hook::ViewListener
      render_on :view_issues_edit_notes_bottom, :partial => 'issues/notify_form'
    end
  end
end

