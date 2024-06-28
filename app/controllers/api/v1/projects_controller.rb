module Api
    module V1
      class ProjectsController < ApplicationController
        skip_before_action :verify_authenticity_token
        before_action :set_project, only: [:update, :destroy]
  
        def index
          @projects = Project.all
          render json: @projects
        end
  
        def create
          @project = Project.new(project_params)
          if @project.save
            render json: @project, status: :created
          else
            render json: @project.errors, status: :unprocessable_entity
          end
        end
  
        def update
          if @project.update(project_params)
            render json: @project
          else
            render json: @project.errors, status: :unprocessable_entity
          end
        end
  
        def destroy
          @project.destroy
          head :no_content
        end
  
        private
  
        def set_project
          @project = Project.find(params[:id])
        end
  
        def project_params
          params.require(:project).permit(:name, :description, :technologies, :image_url)
        end
      end
    end
  end