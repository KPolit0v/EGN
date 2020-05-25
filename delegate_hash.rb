# frozen_string_literal: true

class DelegateHash
  def initialize(target, method_hash)
    @target = target
    @method_hash = method_hash.dup
  end

  def [](element)
    @target.send(@method_hash[element])
  end
end