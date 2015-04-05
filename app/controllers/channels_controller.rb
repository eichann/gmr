class ChannelsController < ApplicationController
  def show
    @impressions = Channel.find(id_params[:id]).impressions.map { |i| i.url.split("=")[1]}
    @all_count = @impressions.count
  end

  def new
    @channel = Channel.new
  end

  def create
    Channel.create(name: attr_params[:name], description: attr_params[:description])
  end

  def search
    @channels = Channel.where('name LIKE(?)', "%#{search_params[:keyword]}%").limit(20)
  end

  private
    def id_params
      params.permit(:id)
    end

    def attr_params
      parmas.permit(:name, :description)
    end

    def search_params
      params.permit(:keyword)
    end
end
