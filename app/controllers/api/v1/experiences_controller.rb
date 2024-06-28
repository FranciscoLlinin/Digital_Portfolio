module Api
    module V1
      class ExperiencesController < ApplicationController
        skip_before_action :verify_authenticity_token
        before_action :set_experience, only: [:update, :destroy]
  
        def index
          @experiences = Experience.all
          render json: @experiences
        end
  
        def create
          @experience = Experience.new(experience_params)
          if @experience.save
            render json: @experience, status: :created
          else
            render json: @experience.errors, status: :unprocessable_entity
          end
        end
  
        def update
          if @experience.update(experience_params)
            render json: @experience
          else
            render json: @experience.errors, status: :unprocessable_entity
          end
        end
  
        def destroy
          @experience.destroy
          head :no_content
        end
  
        private
  
        def set_experience
          @experience = Experience.find(params[:id])
        end
  
        def experience_params
          params.require(:experience).permit(:company, :position, :start_date, :end_date, :description)
        end
      end
    end
  end