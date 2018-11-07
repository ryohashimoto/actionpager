# frozen_string_literal: true

module ActionPager
  class Pager
    DEFAULTS = { page: 1, per: 20, near: 2 }.freeze

    attr_reader :current_page, :per_page, :near, :collection, :options

    def initialize(collection, options={})
      @options = options
      opts = DEFAULTS.merge(options)
      @current_page = opts[:page]
      @per_page = opts[:per]
      @near = opts[:near]
      @collection = collection
    end

    def scoped
      warn "[DEPRECATION] `scoped` is deprecated.  Please use `current_collection` instead."
      current_collection
    end

    def current_collection
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

    def first_page
      1
    end

    def first_page?
      current_page == 1
    end

    def last_page
      @last_page ||= collection_count / per_page + 1
    end
    alias_method :total_pages, :last_page

    def last_page?
      current_page == last_page
    end

    def prev_page
      page = current_page - 1
      page >= 1 ? page : nil
    end

    def next_page
      page = current_page + 1
      page <= last_page ? page : nil
    end

    def shown_page_count
      near * 2 + 1
    end

    # pages that numbers are displayed
    def near_pages
      @near_pages ||= begin
        if current_page <= near + 1
          upper_page = shown_page_count >= last_page ? last_page : shown_page_count
          1..upper_page
        elsif current_page >= last_page - near - 1
          bottom_page = last_page - shown_page_count + 1
          (bottom_page > 1 ? bottom_page : 1)..last_page
        else
          bottom_page = current_page - near
          upper_page = current_page + near
          (bottom_page > 1 ? bottom_page : 1)..(upper_page < last_page ? upper_page : last_page)
        end
      end
    end

    # show bottom (left) gap mark in pager?
    def bottom_gap?
      near_pages.first > 1
    end

    # show upper (right) gap mark in pager?
    def upper_gap?
      near_pages.last < last_page
    end
  end
end
