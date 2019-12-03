class VocabListsController < ApplicationController
  before_action :set_vocab_list, only: [:show, :edit, :update, :destroy]

  def index
    @vocab_lists = VocabList.where(user: current_user)
  end

  def show
    @vocab_items = @vocab_list.vocab_items
  end

  def new
    @vocab_list = VocabList.new
    # get langauges current user is seeking
    @langauges = current_user.user_languages.filter(&:seeking).map {|ul| ul.language}
  end

  def create
    vocab_list = VocabList.new(vocab_list_params)
    vocab_list.user = current_user

    if vocab_list.save
      redirect_to vocab_lists_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_vocab_list
    @vocab_list = VocabList.find(params[:id])
  end

  def vocab_list_params
    params.require(:vocab_list).permit(:language_id)
  end
end
