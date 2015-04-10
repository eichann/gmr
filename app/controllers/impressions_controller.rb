class ImpressionsController < ApplicationController

  def index
    @current_channel = Channel.find(1)
    @all_count = Impression.count
    @impressions = Impression.all.map { |i| i.url.split("=")[1]}
  end

  def create
    channel_impressions = Impression.where(channel_id: attr_params[:channel_id])
    @impression = channel_impressions.where(url: attr_params[:url]).first_or_initialize
    @impression.channel_id = attr_params[:channel_id]
    respond_to do |format|
      if @impression.save
        format.js
      else
        render :index
      end
    end
  end

  private

  def attr_params
    params.permit(:url, :channel_id)
  end

end
