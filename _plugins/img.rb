class Image < Liquid::Tag
  # Matches "   /img/dzif.gif   " as "/img/dzif.gif".
  SYNTAX = /^\s*([^\s]+)/

  def initialize(tag_name, markup, tokens)
    super

    matches = markup.match(SYNTAX)
    fail 'No IMG path provided in the "img" tag"' unless matches

    @path = matches[1]
  end

  def render(context)
    %(<div class="wide"><img src="#{ @path }"/></div>)
  end

  Liquid::Template.register_tag("test", self)
end