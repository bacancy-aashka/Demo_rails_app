class AddressController < ApplicationController
    before_action :set_address, only: [:edit, :update, :show, :destroy]

    def index
        @addresses = Address.all
    end

    def show
    end
    
    private
    def set_address
        
    end
end