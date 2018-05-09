class Organization
  attr_reader :login,
              :url,
              :avatar_url

  def initialize(attributes)
    @login      = attributes[:login]
    @url        = attributes[:url]
    @avatar_url = attributes[:avatar_url]
  end
end
