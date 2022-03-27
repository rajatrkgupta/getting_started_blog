module ArticlesHelper
  def show_articles_index_card_image(article)
    image = article.image.persisted? ? article.image : "default_image.png"

    link_to article_path(article) do
      image_tag image, class: "card-img-top", alt: article.title
    end
  end
end
