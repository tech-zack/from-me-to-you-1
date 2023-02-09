# crumb :root do
#   link "ホーム", root_path
# end

crumb :libraries_index do
   link "ホーム", libraries_index_path
end

crumb :libraries_shows do
  link "説明", libraries_show_path
  parent :libraries_index
end

crumb :posts_index do
  link "閲覧室", posts_index_path
  parent :libraries_index
end

crumb :post_category do
  link "カテゴリー", post_category_path
  parent :posts_index
end

crumb :search_posts do
  link "検索", search_posts_path
  parent :posts_index
end

crumb :posts_new do
  link "投稿", posts_path
  parent :posts_index
end
# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).