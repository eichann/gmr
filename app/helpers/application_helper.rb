module ApplicationHelper
  def music_select(impression)
    impression.url.split("=")[1]
  end
end
