class MicropostsControllerService
  class << self

    # 投稿postを作成する。
    def create_post(user_id, content)
      post = Micropost.new(user_id: user_id, content: content)
      return post
    end

    # 個人の投稿を探す。
    def find_personal_micropst(user_id)
      posts = Micropost.where(user_id: user_id)
      return posts
    end

    # 指定されたIDの記事を探す。
    def find_micropost(id)
      micropost = Micropost.find(id)
      return micropost
    end

  end
end