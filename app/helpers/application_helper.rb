module ApplicationHelper
  def music_select(impression)
    impression.url.split("=")[1]
  end
  
  def br(str)
    h(str).gsub(/(\r\n?)|(\n)/, "<br />").html_safe
  end
end
