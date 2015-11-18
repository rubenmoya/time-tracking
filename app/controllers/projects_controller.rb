class ProjectsController < ApplicationController
  before_action :find_project, except: [:index, :new, :create]

  def index
    @projects = Project.last_created_projects(10)
  end

  def show
    @entries = @project.entries
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, :flash => { :success => "Project has been created" }
    else
      render 'new', :flash => { :danger => "Project has not been created" }
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, :flash => { :success => "Project has been updated" }
    else
      render 'edit', :flash => { :danger => "Project has not been updated" }
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path, notice: 'Project was successfully deleted.'
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
