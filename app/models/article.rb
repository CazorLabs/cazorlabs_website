class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  after_create :convert_markdown
  scope :published, -> { where("publish_date <= ?", Time.now) }


  private

    def convert_markdown
      self.markdown = markdown_parser(self.content)
      save
    end

    class CodeRayify < Redcarpet::Render::HTML
      def block_code(code, language)
        CodeRay.scan(code, language).div
      end
    end

    def markdown_parser(text)
      coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
      options = {
        fenced_code_blocks: true,
        no_intra_emphasis: true,
        autolink: true,
        lax_html_blocks: true
      }
      markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
      markdown_to_html.render(text)
    end
end
