class SponsoredProjectSponsorsController < ApplicationController

  layout 'cmu_sv'

  def new
    @sponsor = SponsoredProjectSponsor.new
  end

  def edit
    @sponsor = SponsoredProjectSponsor.find(params[:id])
  end

  def create
    @sponsor = SponsoredProjectSponsor.new(params[:sponsored_project_sponsor])

    if @sponsor.save
      flash[:notice] = 'Sponsor was successfully created.'
      redirect_to(sponsored_projects_path)
    else
      render "new"
    end
  end

  def update
    @sponsor = SponsoredProjectSponsor.find(params[:id])

    if @sponsor.update_attributes(params[:sponsored_project_sponsor])
      flash[:notice] = 'Sponsor was successfully updated.'
      redirect_to(sponsored_projects_path)
    else
      render "edit"
    end
  end
  
  def archive
    @sponsor = SponsoredProjectSponsor.find(params[:id])
    if @sponsor.update_attributes({:is_archived => true})
      flash[:notice] = 'Sponsor was successfully archived.'
      redirect_to(sponsored_projects_path)
    else
      flash[:notice] = 'Sponsor could not be archived.'
      redirect_to(sponsored_projects_path)
    end
  end
end
