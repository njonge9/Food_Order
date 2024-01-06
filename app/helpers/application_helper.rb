module ApplicationHelper
  def title
    return t("sokko") unless content_for?(:title)

    "#{content_for(:title)} | #{t("sokko")}"
  end
end
