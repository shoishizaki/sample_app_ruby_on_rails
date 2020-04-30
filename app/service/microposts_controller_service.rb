class MicropostsControllerService
  class << self

    # 投稿postを作成する。
    def create_post(user_id, content)
      post = Micropost.new(user_id: user_id, content: content)
      if post.save
        return true
      else
        return false
      end
    end

    # 個人の投稿を探す。
    def find_personal_micropst(user_id)
      posts = Micropost.where(user_id: user_id)
      return posts
    end

    # 投稿を削除する。
    def destoroy_micropost(id)
      micropost = Micropost.find(id)
      if micropost
        micropost.destroy
        return true
      else
        return false
      end
    end

  end
end