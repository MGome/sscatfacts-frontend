module ApplicationHelper
  def should_hide_navbar(params)
    (%w[users sessions].include?(params[:controller]) && params[:action] == 'new') ||
      (params[:controller] == 'main' && params[:action] == 'home')
  end

  def active_for_index(params)
    params[:action] == 'index'
  end

  def active_for_most_popular(params)
    params[:action] == 'most_popular'
  end

  def active_for_my_likes(params)
    params[:action] == 'my_cat_facts'
  end
end
