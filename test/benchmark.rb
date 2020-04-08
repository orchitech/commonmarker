# frozen_string_literal: true

require 'commonmarker-sourcepos-fix'
require 'github/markdown'
require 'redcarpet'
require 'kramdown'
require 'benchmark'

def dobench(name, &blk)
  puts name
  puts Benchmark.measure(&blk)
end

benchinput = File.open('test/benchinput.md', 'r').read

printf("input size = %<bytes>d bytes\n\n", benchinput.bytesize)

dobench('redcarpet') do
  Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: false, tables: false).render(benchinput)
end

dobench('github-markdown') do
  GitHub::Markdown.render(benchinput)
end

dobench('commonmarker with to_html') do
  CommonMarkerSourceposFix.render_html(benchinput)
end

dobench('commonmarker with ruby HtmlRenderer') do
  CommonMarkerSourceposFix::HtmlRenderer.new.render(CommonMarkerSourceposFix.render_doc(benchinput))
end

dobench('kramdown') do
  Kramdown::Document.new(benchinput).to_html(benchinput)
end
