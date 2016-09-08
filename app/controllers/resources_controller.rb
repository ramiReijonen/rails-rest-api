require 'rubygems'
require 'nokogiri'    
require 'open-uri'

class ResourcesController < ApplicationController

  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  def index
    @resources = Resource.all
    render json: @resources
  end

  # GET /resources/1
  def show
    @webcontents = Webcontent.where(url_id: @resource.id)
    render json: @webcontents
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  def create
    @resource = Resource.new(resource_params)
    
    if @resource.save
      parse_store_content(@resource.id, @resource.url)

      @webcontents = Webcontent.where(url_id: @resource.id)
      # render :show, status: :created, location: @resource
      render json: :show, status: :created, location: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /resources/1
  def update
    if @resource.update(resource_params)
      render :show, status: :ok, location: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resources/1
  def destroy
    @resource.destroy
    head :no_content
  end

  private
    def set_resource
      @resource = Resource.find(params[:id])
    end

    def resource_params
      params.require(:resource).permit(:url, :sort)
    end

    def parse_store_content(url_id=nil,url=nil)
      # Parse given url and get contents of a, h1, h2, h3 tags 
      page = Nokogiri::HTML(open(url))   
      a_tags = page.css("a")
      h1_tags = page.css("h1")
      h2_tags = page.css("h2")
      h3_tags = page.css("h3")
      # Store the contents to SQLite3 Database.
      for i in 0..a_tags.length-1
        Webcontent.create(url_id: url_id, tag_type:"a", content: a_tags[i].text)
      end

      for i in 0..h1_tags.length-1
        Webcontent.create(url_id: url_id, tag_type:"h1", content: h1_tags[i].text)
      end

      for i in 0..h2_tags.length-1
        Webcontent.create(url_id: url_id, tag_type:"h2", content: h2_tags[i].text)
      end

      for i in 0..h3_tags.length-1
        Webcontent.create(url_id: url_id, tag_type:"h3", content: h3_tags[i].text)
      end
      
    end
end
