class AssetsController < ApplicationController
  
  before_action :find_project
  def index
    @assets = @project.assets
  end

  def show
    @asset = @project.assets.find(params[:project_id])
  end

  def new
    @asset = @project.assets.new
  end

  def create
    @asset = @project.assets.new(asset_params)

    if @asset.save
      redirect_to project_asset(@project, @asset), notice: 'Asset added!'
    else
      flash[:notice] = 'There was an error.'
      render :new
    end
  end

  def edit
    @asset = @project.assets.find_by_id(params[:project_id])
  end

  def update
    @asset = @project.assets.find_by_id(params[:project_id])
    if @asset.update(asset_params)
      redirect_to project_asset(@project, @asset), notice: 'File Updated'
    else
      flash[:notice] = 'Could not update, There was an error.'
      render :new
    end
  end

  def destroy
    @asset = @project.assets.find(params[:id])
    @asset.destroy
    redirect_to project_asset(@project, @asset), notice: 'File has been removed'
  end

  def get
    asset = @project.assets.find_by_id(params[:project_id])
    if asset
      send_file @project.asset.uploaded_file.path, type: @project.asset.uploaded_file_content_type
    else
      flash[:error] = "You do not have permission to access this file. "
      redirect_to project_asset(@project, @asset)
    end
  end


  private

     def find_project
      @project = Project.find(params[:project_id])
    end
    def set_asset
      @asset = Asset.find(params[:project_id])
    end

    def asset_params
      params.require(:asset).permit(:project_id, :uploaded_file)
    end
end
