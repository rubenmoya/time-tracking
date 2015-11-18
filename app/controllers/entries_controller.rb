class EntriesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @entries = @project.entries
  end
  
  def new
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new
  end

  def create
    @project = Project.find(params[:project_id])
    @entry = @project.entries.new(entry_params)

    if @entry.save
      redirect_to @project, :flash => { :success => "Entry has been created" }
    else
      render 'new', :flash => { :danger => "Entry has not been created" }
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])

    if @entry.update(entry_params)
      redirect_to @project, :flash => { :success => "Entry has been updated" }
    else
      render 'edit', :flash => { :danger => "Entry has not been updated" }
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @entry = @project.entries.find(params[:id])

    @entry.destroy
    redirect_to @project, notice: 'Project was successfully deleted.'
  end

  private

  def entry_params
    params.require(:entry).permit(:hours, :minutes, :comment, :date)
  end
end
