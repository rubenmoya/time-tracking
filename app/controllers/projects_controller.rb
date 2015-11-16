class ProjectsController < ApplicationController
  before_action :find_project, except: [:index, :new, :create]

  def index
    @projects = Project.last_created_projects(10)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render 'edit'
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
