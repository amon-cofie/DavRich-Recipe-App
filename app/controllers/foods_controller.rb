class FoodsController < ApplicationController
    def index
        @foods = Food.all
    end
    
    def show
        @food = Food.where(:id = params[:id])   
    end
end
