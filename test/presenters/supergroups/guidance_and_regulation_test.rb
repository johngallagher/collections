require 'test_helper'

include RummagerHelpers

describe Supergroups::GuidanceAndRegulation do
  let(:taxon_id) { '12345' }
  let(:guidance_and_regulation_supergroup) { Supergroups::GuidanceAndRegulation.new }

  describe '#document_list' do
    it 'returns a document list for the guidance and regulation supergroup' do
      MostPopularContent.any_instance
        .stubs(:fetch)
        .returns(section_tagged_content_list('guidance'))

      expected = [
        {
          link: {
            text: 'Tagged Content Title',
            path: '/government/tagged/content'
          },
          metadata: {
            public_updated_at: '2018-02-28T08:01:00.000+00:00',
            organisations: 'Tagged Content Organisation',
            document_type: 'Guidance'
          }
        }
      ]

      assert_equal expected, guidance_and_regulation_supergroup.document_list(taxon_id)
    end

    it 'return a document list for guides' do
      MostPopularContent.any_instance
        .stubs(:fetch)
        .returns(section_tagged_content_list('guide'))

      expected = [
        {
          link: {
            text: 'Tagged Content Title',
            path: '/government/tagged/content',
            description: 'Description of tagged content',
          },
          metadata: {
            document_type: 'Guide'
          }
        }
      ]

      assert_equal expected, guidance_and_regulation_supergroup.document_list(taxon_id)
    end
  end
end