module WelcomeHelper

  class HTMLBlockCode < Redcarpet::Render::HTML
    include ActionView::Helpers::AssetTagHelper

    def image(link, title, alt_text)
      image_tag(link, title: title, alt: alt_text, width: "100%")
    end
  end

  def markdown(text)
    renderer = HTMLBlockCode.new
    text.gsub!(/(https?:\/\/[\S]*.jpg)/, '![](\1)')
    markdown = Redcarpet::Markdown.new(renderer)
    markdown.render(text).html_safe
  end

end
