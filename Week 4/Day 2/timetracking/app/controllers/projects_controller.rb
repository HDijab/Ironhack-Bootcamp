class ProjectsController < ApplicationController
  def index
    @projects = Project.ordered_by_creation
    render layout: 'no_projects' if @projects.empty?
  end

  def show
    @project = Project.find params[:id]
    @hours, @minutes  = @project.total_hours_in_month
  rescue ActiveRecord::RecordNotFound
    render 'no_projects_found'

  # unless @project = Project.find_by(id: params[:id])
  #   render 'no_projects_found'
  # end

  # render_404 method is in application controller
  # @project = Project.find_by(id: params[:id]) || render_404(params)
  end
end
