class SpeakersController < ApplicationController
  before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]

  def index
    @speakers = Speaker.all.paginate(:page => params[:page], :per_page => 4)
  end

  def show
    @speaker = Speaker.find(speaker_params)
    # @comment = Comment.new
    # @comment.speaker_id = @speaker.id
    
  end

  def new
    @speaker = Speaker.new
  end

  def create
      @speaker = Speaker.new(speaker_params)
      @speaker.save
      flash.notice = "Profile '#{@speaker.name}' Created!" 
      # speakerMailer.send_emails_request(@speaker)
      redirect_to speaker_path(@speaker)
  end

  def edit
    @speaker = Speaker.find(params[:id])
  end

  def update
    @speaker = Speaker.find(params[:id])
    @speaker.update(speaker_params)
    flash.notice = "Profile '#{@speaker.title}' Updated!"
    redirect_to speaker_path(@speaker)
  end

  def destroy
    @speaker = Speaker.find(params[:id])
    @speaker.destroy
    flash.notice = "Profile '#{@speaker.title}' Deleted!"
    redirect_to speakers_path
  end

private  
  def speaker_params
    params.require(:speaker).permit(:name, :headline, :contact, :topics, :description)
  end

end
