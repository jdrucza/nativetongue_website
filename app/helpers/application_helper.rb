module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  # Implements the world-famous Paul Irish IE conditional comments HTML tag--in HAML
  # http://paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/
  def cc_html(options={}, &blk)
    attrs = options.map { |(k, v)| " #{h k}='#{h v}'" }.join('')
    [ "<!--[if lt IE 7]> <html#{attrs} class='lt-ie9 lt-ie8 lt-ie7'> <![endif]-->",
      "<!--[if IE 7]>    <html#{attrs} class='lt-ie9 lt-ie8'> <![endif]-->",
      "<!--[if IE 8]>    <html#{attrs} class='lt-ie9'> <![endif]-->",
      "<!--[if gt IE 8]><!--> <html#{attrs} class=''> <!--<![endif]-->",
      capture_haml(&blk).strip,
      "</html>"
    ].join("\n")
  end

  def h(str); Rack::Utils.escape_html(str); end
end
