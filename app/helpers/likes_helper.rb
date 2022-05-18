module LikesHelper
  def like_toggle_link(record)
    link_title = record.is_liked_by_user?(current_user.id) ? "Dislike" : "Like"

    link_to link_title,
      like_record_path(record_id: record.id, record_type: record.class.name.parameterize),
      method: :post, title: "Click to #{link_title}"
  end
end
