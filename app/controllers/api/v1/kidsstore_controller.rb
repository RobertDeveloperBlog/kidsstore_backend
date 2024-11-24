module Api
    module V1
      class KidsstoreController < ApplicationController
        def index
            @kidsstores = Kidstore.all
            render json: @kidsstores
          end

          def show
            @kidsstore = Kidstore.find(params[:id])
            render json: @kidsstore
          end

          def create
            @kidsstore = Kidstore.new(kidsstore_params)
            if @kidsstore.save
              render json: @kidsstore, status: :created
            else
              render json: @kidsstore.errors, status: :unprocessable_entity
            end
          end

          def update
            @kidsstore = Kidstore.find(params[:id])
            if @kidsstore.update(kidsstore_params)
              render json: @kidsstore
            else
              render json: @kidsstore.errors, status: :unprocessable_entity
            end
          end

          def destroy
            @kidsstore = Kidstore.find(params[:id])
            @kidsstore.destroy
            head :no_content
          end

          private

          def kidsstore_params
            params.require(:kidsstore).permit(:name, :imgUrl, :price)
          end
      end
    end
  end