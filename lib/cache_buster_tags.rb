module CacheBusterTags 
  include Radiant::Taggable
  class TagError < StandardError; end
  desc %{
Renders a cache buster.

*Usage:*

<pre><code><img src="http://example.com/some/external/image.png<r:cache_buster /></code>"></pre>

The above example will produce the following:

<pre><code><img src="http://example.com/some/external/image.png?123456789</code>"></pre>

Custom Cache Busters:

<pre><code><img src="http://example.com/some/external/image.png<r:cache_buster name="my_buster" timeout="120" /></code>"></pre>

The above example will produce the following:

<pre><code><img src="http://example.com/some/external/image.png?123456789</code>"></pre>

Using the <i>name</i> attribute created a custom cache buster for named items, e.g. you could create a <i>javascript</i> cache buster for all javascript includes.

Using the <i>timeout</i> attribute creates a custon timeout for that cache buster. It's worth noting, that while it's possible to create a custom cache buster and use it in two different places with different timeouts, it will behave oddly, yet not break.
  }
  tag 'cache_buster' do |tag|
    name    = (tag.attr['name']    ? tag.attr['name']    : CacheBuster::MASTER_BUSTER)
    timeout = (tag.attr['timeout'] ? tag.attr['timeout'] : nil)
    CacheBuster.buster!(name, timeout)
  end
end
