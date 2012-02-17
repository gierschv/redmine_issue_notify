require 'redmine'

Redmine::Plugin.register :redmine_issue_notify do
  name 'Redmine Issue Notify plugin'
  author 'Vincent Giersch'
  description 'Notify specific project users in a issue reply'
  version '0.0.1'
end

require 'redmine_issue_notify/hooks/model_issue_hook'
require 'redmine_issue_notify/hooks/views_issue_hook'
