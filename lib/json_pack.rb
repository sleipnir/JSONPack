require "bundler"

Bundler.require

class JSONPack
  include JSON::Pure

  class << self
  # The following class methods allow you can parse JSON objects
  # in a serialized format.
  # Using the serialization method to provide MessagePack
  # Json serialized objects.
  # Usage
  #  Pack
  #
  #  arry = [1,2,3]
  #  obj = JSONPack.pack arry
  #  produces => "\xA7[1,2,3]"
  #
  #  Unpack
  #
  #  x = JSONPack.unpack obj
  #  produces => [1, 2, 3]

    def pack obj
      pack = JSON.generate obj
      pack.to_msgpack
    end

    def unpack obj
      unpack = MessagePack.unpack obj
      return JSON.parse unpack
    end
  end
end