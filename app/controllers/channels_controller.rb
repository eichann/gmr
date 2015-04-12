class ChannelsController < ApplicationController
  def show
    @current_channel = Channel.find(id_params[:id])
    @impressions = @current_channel.impressions.map { |i| i.url.split( /=|&/ )[1]}
    @all_count = @impressions.count
  end

  def new
    @channel = Channel.new
  end

  def create
    Channel.create(name: attr_params[:name], description: attr_params[:description])
    redirect_to "/channels/#{Channel.last.id}"
  end

  def search
    @channels = Channel.where('name LIKE(?)', "%#{search_params[:keyword]}%").limit(20)
  end

  def check_password
    channel = Channel.find(id_params[:id])
    channel.enable_request! if channel.password == password_params[:password]
    redirect_to "/channels/#{channel.id}"
  end

  private
    def id_params
      params.permit(:id)
    end

    def attr_params
      params.require(:channel).permit(:name, :description, :password)
    end

    def search_params
      params.permit(:keyword)
    end

    def password_params
      params.permit(:password)
    end

end
