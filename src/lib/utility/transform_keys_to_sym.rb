module Utility
  def transform_keys_to_sym(arg) # rubocop:disable Metrics/MethodLength
    if arg.is_a?(Array) # rubocop:disable Style/CaseLikeIf
      arg.map do |value|
        transform_keys_to_sym(value)
      end
    elsif arg.is_a?(Hash)
      arg.to_h do |key, value|
        [key.to_sym, transform_keys_to_sym(value)]
      end
    else
      arg
    end
  end

  module_function :transform_keys_to_sym
end
