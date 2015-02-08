class ImpressionsController < ApplicationController
  def index
    @all_count = Impression.count
    @impressions = Impression.all.map { |i| i.url.split("=")[1]}
  end

  def create
    Impression.create(url: params[:url], status: 0)
    redirect_to action: :index
  end
end
