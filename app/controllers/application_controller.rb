class ApplicationController < ActionController::Base
  before_action :set_search

  private

  def set_search
    @q = Flavor.ransack(params[:q])
    @categories = Category.all
    @flavors = @q.result(distinct: true).includes(:categories)
  end
end
