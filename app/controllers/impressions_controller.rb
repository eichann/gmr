class ImpressionsController < ApplicationController

  def index
    @all_count = Impression.count
    @impressions = Impression.all.map { |i| i.url.split("=")[1]}
  end

  def create
    @impression = Impression.where(url: url_params[:url]).first_or_initialize
    respond_to do |format|
      if @impression.save
        format.js
      else
        render :index
      end
    end
  end

  private

  def url_params
    params.permit(:url)
  end
end
