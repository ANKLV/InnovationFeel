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

  def initialize(username, password)
    @username = username
    @password = password
    validate(username)
    validate(password)
  end
end

class Message
  include Validations

  attr_reader :text

  def initialize(text)
    @text = text
    validate(text)
  end
end
