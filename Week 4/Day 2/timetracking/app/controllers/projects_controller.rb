class ProjectsController < ApplicationController
  def index
    @projects = Project.ordered_by_creation
  end
end
