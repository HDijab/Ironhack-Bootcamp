class EntriesController < ApplicationController
  def index
    @project = Project.find params[:project_id]
    @entries = @project.entries
  end

  def new
    @project = Project.find params[:project_id]
    @entry = @project.entries.new
  end

  def edit
    @project = Project.find params[:project_id]
    @entry = @project.entries.find params[:id]
  end

  def create
    @project = Project.find params[:project_id]
    @entry = @project.entries.new entry_params

    if @entry.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def update
    @project = Project.find params[:project_id]
    @entry = @project.entries.find params[:id]

    if @entry.update_attributes entry_params
      redirect_to action: 'index'
    else
      render 'edit'
    end
  end

  private
  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date, :comments)
  end
end
