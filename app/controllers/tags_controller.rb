class TagsController < ApplicationController

  def autocomplete_word
    # オートコンプリートの候補として使いたいデータを取得するためのコード
    @tags = Tag.where("name LIKE ?", "%#{params[:keyword]}%")
    respond_to do |format|
      format.js
    end
  end

end
