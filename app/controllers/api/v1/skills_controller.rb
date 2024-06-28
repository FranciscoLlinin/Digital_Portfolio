module Api
    module V1
        class SkillsController < ApplicationController
            skip_before_action :verify_authenticity_token
            before_action :set_skill, only: [:show, :edit, :update, :destroy]
          
            def index
              @skills = Skill.all
              render json: @skills
            end
          
            def show
            end
          
            def new
              @skill = Skill.new
            end
          
            def create
              @skill = Skill.new(skill_params)
              if @skill.save
                render json: @project, status: :created
              else
                render json: @project.errors, status: :unprocessable_entity
              end
            end
          
            def edit
            end
          
            def update
              if @skill.update(skill_params)
                render json: @project
              else
                render json: @project.errors, status: :unprocessable_entity
              end
            end
          
            def destroy
              @skill.destroy
              head :no_content
            end
          
            private
          
            def set_skill
              @skill = Skill.find(params[:id])
            end
          
            def skill_params
              params.require(:skill).permit(:name, :percentage)
            end
          
        end 
      
    end
  end