class VocabItemsController < ApplicationController
  def index
    @vocab_items = current_user.vocab_items
    # get the language of that last vocab item created in db to preset filter
    @last_vocab_lang_id = VocabItem.order(created_at: :desc).first.id

    # get unique languages of all vocab items
    @languages = current_user.vocab_items.map { |vi| vi.language }.uniq

    @language_option_array = @languages.map { |l| [l.name, l.id] }

    @vocab_item = VocabItem.new
  end

  def show
  end

  def new
    @vocab_item = VocabItem.new
    @languages = current_user.languages


  end

  def create
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
end
