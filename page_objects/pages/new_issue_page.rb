class NewIssuePage < SitePrism::Page

  element :issue_subject, '#issue_subject'
  element :assignee_dropdown, '#issue_assigned_to_id'

  element :issue_create_btn, '#issue-form > input[type=submit]:nth-child(4)'


end