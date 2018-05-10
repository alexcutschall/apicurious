class FollowerEvent
  attr_reader :type,
              :display_login,
              :repo_name,
              :date

  def initialize(information)
    @type = information[:type]
    @display_login = information[:actor][:display_login]
    @repo_name = information[:repo][:name]
    @date = information[:created_at]
  end
end
