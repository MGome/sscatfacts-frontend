module ApplicationHelper
  def should_hide_navbar(params)
    (%w[users sessions].include?(params[:controller]) && params[:action] == 'new') ||
      (params[:controller] == 'main' && params[:action] == 'home')
  end
end
