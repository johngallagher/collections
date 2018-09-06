module Supergroups
  class ResearchAndStatistics < Supergroup
    attr_reader :content

    def initialize
      super('research_and_statistics')
    end

    def tagged_content(taxon_id)
      @content = MostRecentContent.fetch(content_id: taxon_id, filter_content_purpose_supergroup: @name)
    end

    def promoted_content_count
      0
    end
  end
end
