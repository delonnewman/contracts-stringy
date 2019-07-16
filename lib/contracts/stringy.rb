require "contracts/stringy/version"
require "contracts"

# Some contracts to deal with string values that can be coerced appropriately by ActiveRecord
module Contracts
  module Stringy
    INTEGER_REGEX = /\A[\-+]?\d+\z/
    FLOAT_REGEX   = /\A[\-+]?\d+\.\d+\z/
    POS_REGEX     = /\A\d+\z/
    UUID_REGEX    = /\A[0-9a-f]{8}\-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\z/i
    URLSAFE_REGEX = /\A[ \-\+\w]+\z/

    # A string that looks like an integer
    # @see INTEGER_REGEX
    class Int
      def self.valid?(value)
        value.is_a? String and (value =~ INTEGER_REGEX) != nil
      end
    end

    class Float
      def self.valid?(value)
        value.is_a? String and (value =~ FLOAT_REGEX) != nil
      end
    end

    # A string that looks like a positive integer
    # @see POS_REGEX
    class Pos
      def self.valid?(value)
        value.is_a? String and (value =~ POS_REGEX) != nil
      end
    end

    # A string that is equal to either 'true', 'false', '0', or '1'.
    class Bool
      def self.valid?(value)
        value.is_a? String and value == 'true' or value == 'false' or value == "0" or value == "1"
      end
    end

    # A string that looks like a UUID
    # @see UUID_REGEX
    class UUID
      def self.valid?(value)
        value.is_a? String and (value =~ UUID_REGEX) != nil
      end
    end

    # A url safe string
    # @see URLSAFE_REGEX
    class URLSafe
      def self.valid?(value)
        value.is_a? String and (value =~ URLSAFE_REGEX) != nil
      end
    end

    class Name
      # TODO: refine this
      def self.valid?(value)
        value.is_a? String
      end
    end
  end

  StrInt   = Stringy::Int
  StrFloat = Stringy::Float
  StrPos   = Stringy::Pos
  StrBool  = Stringy::Bool
  StrUUID  = Stringy::UUID
  URLSafe  = Stringy::URLSafe
  Name     = Stringy::Name
end
