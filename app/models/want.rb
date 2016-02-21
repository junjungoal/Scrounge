class Want < ActiveRecord::Base
  belongs_to :user

  attr_accessor :title, :image_url, :url, :item_id

  def initialize(title, image_url, url, item_id)
    @title = title
    @image_url = image_url
    @url = url
    @item_id = item_id
  end

  def self.search_wants_by_amazon(keyword)
    Amazon::Ecs.debug = true
    wants = Amazon::Ecs.item_search(
      keyword,
      search_index:  'All',
      dataType: 'script',
      response_group: 'ItemAttributes, Images',
      country:  'jp',
    )
    @wants = []
    wants.items.each do |item|
      want = Want.new(
        item.get('ItemAttributes/Title'),
        item.get('LargeImage/URL'),
        item.get('DetailPageURL'),
        item.get('ASIN'),
      )
      @wants << want
    end
    @wants
  end
end
