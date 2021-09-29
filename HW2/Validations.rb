# frozen_string_literal: true

module Validations
  MIN_PASS_SIZE = 8
  MAX_TEXT_SIZE = 280

  def validate(param)
    if param.nil? || param.size.zero?
      raise ArgumentError, "Can't be blank"
    elsif param.size < MIN_PASS_SIZE && param == @password
      raise ArgumentError, 'Password must be at least 8 characters'
    elsif param.size > MAX_TEXT_SIZE
      raise ArgumentError, 'Maximum message size 280 characters'
    end

    self
  end
end

class User
  include Validations

  attr_reader :username, :password

  def username=(username)
    @username = username
    validate(username)
  end

  def password=(password)
    @password = password
    validate(password)
  end

  def initialize(username, password)
    self.username = username
    self.password = password
  end
end

class Message
  include Validations

  attr_accessor :text

  def text=(text)
    @text = text
    validate(text)
  end

  def initialize(text)
    self.text = text
  end
end
