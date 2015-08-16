require_dependency "auth_forum/application_controller"

module AuthForum
  class EventsController < ApplicationController

    def index
     @events = Event.all
    end

    def new
      @event = Event.new
    end

    def show
      @event = Event.find_by_id(params[:id])
    end

    def create
      product = Product.find_by_id(event_params[:product_id])
      if !product.event.present?
        @event = Event.new(event_params)
        if @event.save
          redirect_to @event, notice: 'Event was successfully Created.'
        else
          render 'index'
        end
      else
        render 'index'
      end
    end


    private

    def event_params
      params.require(:event).permit(:name, :title, :description, :product_id)
    end
  end
end
