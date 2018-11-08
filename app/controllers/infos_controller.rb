class InfosController < ApplicationController
    def index
        @home = Info.first
    end
    
end
