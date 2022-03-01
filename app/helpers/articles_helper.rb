module ArticlesHelper

  def article_like_toggle_link(article)
    like_name = article.is_liked_by_user?(current_user.id) ? "Dislike" : "Like"

    link_to like_name, like_toggle_article_path(@article), method: :post, title: "Click to #{like_name}"
  end
end
