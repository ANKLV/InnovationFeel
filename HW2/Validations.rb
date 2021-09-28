module Validations
MIN_PASS_SIZE = 8
MAX_TEXT_SIZE = 280

  def validate(param)
    case
    when param == nil || param.size == 0
      raise ArgumentError.new("Can't be blank")
    when param.size < MIN_PASS_SIZE && param == @password
      raise ArgumentError.new("Password must be at least 8 characters")
    when param.size > MAX_TEXT_SIZE
      raise ArgumentError.new("Maximum Message size 280 characters")
    end
    self
  end
end

class User
  include Validations

  attr_reader :username, :password

  def initialize(username, password)
    @username = username
    @password = password
    self.validate(username)
    self.validate(password)
  end
end

class Message
  include Validations

  attr_reader :text

  def initialize(text)
    @text = text
    self.validate(text)
  end
end