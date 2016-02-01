module ApplicationHelper

  # ページごとのタイトルを返す
  def full_title(page_title='')
    base_tile = "ImageBoard"
    if page_title.empty?
      base_tile
    else
      page_title + " | " + base_tile
    end
  end
end
