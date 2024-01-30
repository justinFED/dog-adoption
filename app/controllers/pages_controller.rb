class PagesController < ApplicationController
    include Rails.application.routes.url_helpers
    def index
    end

    def show
        @landing_page = landing_page_path
    end
end
