module ApplicationHelper
  def active_class(link_path)
    "active" if current_page?(link_path)
  end

  def can_class(method, model)
    "disabled" if cannot? method, model
  end
end
