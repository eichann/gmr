class ChannelsController < ApplicationController
  def show
    @channel = Channel.find(id_params[:id])
  end

  def new
    @channel = Channel.new
  end

  def create
    Channel.create(name: attr_params[:name], description: attr_params[:description])
  end

  private
    def id_params
      params.permit(:id)
    end

    def attr_params
      parmas.permit(:name, :description)
    end
end
