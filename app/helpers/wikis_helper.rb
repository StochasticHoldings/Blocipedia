module WikisHelper
  def form_group_tag(errors, &block)
   css_class = 'form-group'
   css_class << ' has-error' if errors.any?
   content_tag :div, capture(&block), class: css_class
 end

 def markdown(text)
   extensions = [:tables, :fenced_code_blocks, :autolink, :strikethrough, :underline, :highlight, :quote, :footnotes]
   #extensions = [:tables, :fenced_code_blocks, :autolink, :strikethrough, :underline, :highlight, :quote, :footnotes] 
   Markdown.new(text, *extensions).to_html.html_safe
 end
end
