module Api
    module V1
      class StudiesController < ApplicationController
        skip_before_action :verify_authenticity_token
        before_action :set_study, only: [:update, :destroy]
  
        def index
          @studies = Study.all
          render json: @studies
        end
  
        def create
          @study = Study.new(study_params)
          if @study.save
            render json: @study, status: :created
          else
            render json: @study.errors, status: :unprocessable_entity
          end
        end
  
        def update
          if @study.update(study_params)
            render json: @study
          else
            render json: @study.errors, status: :unprocessable_entity
          end
        end
  
        def destroy
          @study.destroy
          head :no_content
        end
  
        private
  
        def set_study
          @study = Study.find(params[:id])
        end
  
        def study_params
          params.require(:study).permit(:institution, :degree, :start_date, :end_date, :description)
        end
      end
    end
  end