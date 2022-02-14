class StaticPagesController < ApplicationController
  before_action :recommend_params
  def top
    @flavors = Flavor.all
  end

  def search
    @recommend = Recommend.find_by(taste: recommend_params[:taste])
    if recommend_params[:experience] == "beginner"
      temporary_flavors = Flavor.joins(:categories).where(categories: {kind: ["定番", "初心者におすすめ"]}).uniq
    else
      temporary_flavors = Flavor.all
    end
    flavor_arry = []
    taste_status = recommend_params[:taste]
    feeling_status = recommend_params[:feeling]
    temporary_flavors.each do |flavor|
      flavor_arry.push flavor.id
    end
    @flavors = Flavor.sorting(flavor_arry, taste_status).feeling(feeling_status).order(score: :desc)
  end

  def result
    render root_path
  end

  private
  def recommend_params
    params.permit(:experience, :taste, :feeling)
  end
end
