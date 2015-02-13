class ImpressionsController < ApplicationController

  def index
    @all_count = Impression.count
    @impressions = Impression.all.map { |i| i.url.split("=")[1]}
  end

  def create
    @impression = Impression.where(url: url_params[:url]).first_or_initialize

    if @impression.save
      redirect_to @imperssion, notice: 'ok!'
    else
      render :index
    end
  end

  private

  def url_params
    params.permit(:url)
  end
end
