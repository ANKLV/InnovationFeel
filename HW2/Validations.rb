module Validations
  def validate
    if self.class == User
      case
      when username.size == 0
        raise ArgumentError.new("Name can't be blank")
      when password.size < 8
        raise ArgumentError.new("Password must be at least 8 characters")
      end
    else
      case
      when text.size == 0
        raise ArgumentError.new("Message can't be blank")
      when text.size > 280
        raise ArgumentError.new("Maximum message size 280 characters")
      end
    end
    self
  end
end

class User
  include Validations

  attr_reader :username, :password

  def initialize(username, password)
    self.username = username
    self.password = password
    self.validate
  end
end

class Message
  include Validations

  attr_reader :text

  def initialize(text)
    @text = text
    self.validate
  end
end