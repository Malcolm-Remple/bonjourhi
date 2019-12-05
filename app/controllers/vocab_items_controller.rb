
class VocabItemsController < ApplicationController
  def index

    @header_title = "Your Vocab"
    # get vocab in descending order by creation date
    @vocab_items = current_user.vocab_items.order(created_at: :desc)

    # user can add new vocab in any of their seeking langs
    # @new_vocab_form_languages = current_user.user_languages.filter(&:seeking).map {|ul| ul.language}
    # @new_vocab_form_languages = current_user.user_languages.filter(&:seeking).map {|ul| [ul.language.name, ul.language.iso_code]}
    set_new_vocab_form_languages
    @languages = Language.all

    @vocab_item = VocabItem.new
  end

  def show
  end

  def new
    @vocab_item = VocabItem.new
    @languages = current_user.languages


  end

  def create

    set_new_vocab_form_languages
    @vocab_item = VocabItem.new(vocab_item_params)
    @vocab_item.user = current_user



    if @vocab_item.save!
      respond_to do |format|
        format.html { redirect_to vocab_items_path }
        format.js  # <-- will render `app/views/vocab_items/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'vocab_items/index' }
        format.js  # <-- idem
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def vocab_item_params
    params.require(:vocab_item).permit(:language_id, :content)
  end

  def set_new_vocab_form_languages
    last_vocab_lang = VocabItem.order('created_at DESC').first.language
    new_vocab_form_languages = current_user.user_languages.filter(&:seeking).map {|ul| ul.language}
    rest_of_langs = new_vocab_form_languages - [last_vocab_lang]
    # @new_vocab_form_languages = current_user.user_languages.filter(&:seeking).map {|ul| ul.language}
    @new_vocab_form_languages = [last_vocab_lang] + rest_of_langs
  end
end
