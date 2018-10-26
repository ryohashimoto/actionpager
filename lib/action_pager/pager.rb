# frozen_string_literal: true

module ActionPager
  class Pager
    DEFAULTS = { page: 1, per: 20 }.freeze

    attr_reader :current_page, :per_page, :collection, :options

    def initialize(collection, options={})
      @options = options
      opts = DEFAULTS.merge(options)
      @current_page = opts[:page]
      @per_page = opts[:per]
      @collection = collection
    end

    def paginate
      if collection.is_a?(Array)
        collection.drop(offset).first(per_page)
      else # for ActiveRecord::Relation and other OR mapper collections
        collection.offset(offset).limit(per_page)
      end
    end

    def offset
      (current_page - 1) * per_page
    end

    def collection_count
      @_collection_count ||= collection.count
    end

    def first_page?
      current_page == 1
    end

    def last_page
      @last_page ||= collection_count / per_page + 1
    end

    def last_page?
      current_page == last_page
    end
  end
end
