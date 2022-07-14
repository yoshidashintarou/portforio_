class DiariesController < ApplicationController

  def new
    @diary = Diary.new
  end

 def create
    @diary = Diary.new(diary_params)
    @diary = current_user
    if @diary.save
     redirect_to diary_path(@diary)
    else
     flash[:notice] = "空白だと投稿できません"
     render :new
    end
  end

  def show
    @diary = current_user(diary_params)
  end

  private
  def diary_params
    params.permit(:title, :body)
  end
end
