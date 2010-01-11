class BookObserver < ActiveRecord::Observer
  def before_save(book)
    book.author_id = 1 if book.author_id.nil?
  end
end
