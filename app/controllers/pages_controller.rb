class PagesController < ApplicationController
    include Rails.application.routes.url_helpers
    def index
    end

    def show
        @landing_page = landing_page_path
        @adoptions = Dog.where(isActive: true)

    # Set @listing to an appropriate value, or remove it if not needed
             @listing = nil
      end
end
