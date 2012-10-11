module CacheBusterTags 
  include Radiant::Taggable
  class TagError < StandardError; end
  desc %{
Renders a cache buster.

*Usage:*

<pre><code><img src="http://example.com/some/external/image.png<r:cache_buster /></code>"></pre>

The above example will produce the following:

<pre><code><img src="http://example.com/some/external/image.png?123456789</code>"></pre>
  }
  tag 'cache_buster' do |tag|
    CacheBuster.buster
  end
end
