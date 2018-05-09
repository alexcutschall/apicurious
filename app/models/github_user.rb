class GithubUser
  attr_reader :name,
              :image,
              :starred_url,
              :followers,
              :following

  def initialize(attributes)
    @name = attributes[:name]
    @image = attributes[:avatar_url]
    @starred_url = attributes[:starred_url]
    @followers = attributes[:followers]
    @following = attributes[:following]
  end
end
