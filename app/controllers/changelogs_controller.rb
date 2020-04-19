class ChangelogsController < ApplicationController
  load_and_authorize_resource

  def index
    @changelogs = @changelogs.order('created_at DESC')
  end

  def edit
  end

  def new
  end

  def create
    Changelog.create!(changelog_params)
    redirect_to changelogs_path
  end

  def update
    if @changelog.update(changelog_params)
      redirect_to changelogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @changelog.destroy
    redirect_to changelogs_path
  end

  private

  def changelog_params
    params.require(:changelog).permit(:version, :content)
  end
end