module ApplicationHelper
  include Pagy::Frontend

  def application_title
    "CazorLabs"
  end

  def render_icon(icon, classes: nil)
    classes ||= ""
    render "icons/#{icon}", classes: classes
  end
end
