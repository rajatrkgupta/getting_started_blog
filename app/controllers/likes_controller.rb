class LikesController < ApplicationController

  def like_toggle
    record_type = params[:record_type]
    record = record_type.classify.constantize.find(params[:record_id])

    if record.is_liked_by_user?(current_user.id)
      record.likes.find_by_user_id(current_user.id).delete
      message = I18n.t("#{record_type.pluralize}.like_toggle.dislike")
    else
      record.likes.create(user_id: current_user.id)
      message = I18n.t("#{record_type.pluralize}.like_toggle.like")
    end

    redirect_to request.referer, notice: message
  end
end
