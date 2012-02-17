module IssueNotify
  module Hooks
    class ModelIssueHook < Redmine::Hook::ViewListener
      def controller_issues_edit_before_save(context={})
        notify_user(context)
      end

      def controller_issues_edit_after_save(context={})
        unotify_user(context)
      end

      def notify_user(context)
        params = context[:params]
        if params && params[:issue] && !params[:issue][:notify_user].nil?
          context[:issue].watcher_user_ids += params[:issue][:notify_user]
        end
      end
      
      def unotify_user(context)
        params = context[:params]
        if params && params[:issue] && !params[:issue][:notify_user].nil?
          params[:issue][:notify_user].each { |uid| context[:issue].watcher_user_ids = context[:issue].watcher_user_ids.delete(uid) }
        end
      end
    end
  end
end
