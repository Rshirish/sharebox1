
class ProjectsController < ApplicationController
	#before_action :set_asset, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!  #authenticate for users before any met
  def index
    @projects = Project.all
  end
  
def show
    @project = Project.find(params[:id])
  end

	def new
    @project = Project.new
end

def update
  @project = Project.find(params[:id])
 
  if @project.update(project_params)
    redirect_to @project
  else
    render 'edit'
  end
end
	
  def edit
  @project = Project.find(params[:id])
end

	def create
  @project = Project.new(project_params)
 
  if @project.save
    redirect_to @project
  else
    render 'new'
  end
end
def destroy
    @project = Project.find(params[:id])
    @project.destroy
 
    redirect_to projects_path
  end
 
private
  def project_params
    params.require(:project).permit(:title, :text)
  end
end
