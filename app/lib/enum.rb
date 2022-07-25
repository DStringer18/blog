class Enum
  class << self
    def values
      constants.collect {|c| const_get(c)}
    end
    def key(val)
      constants.detect {|c| const_get(c) == val}
    end
    def label(val)
      I18n.t("enum.#{name.underscore}.#{key(val).downcase}")
    end
    def collection
      values.map {|v| [label(v), v]}
    end
  end
end