class StaticPagesControllerService

  # 投稿のデータを全て入手する。
  def get_all_microposts
    microposts = Micropost.all
    return microposts
  end

end