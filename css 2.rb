
# coding: utf-8
# frozen_string_literal: true
require_relative "ruby/nokogiri"

module Nokogiri
  # Translate a CSS selector into an XPath 1.0 query
  module CSS
require_relative "ruby/css/selector_cache"

require_relative "ruby/css/node"

require_relative "ruby/css/xpath_visitor"

require_relative "ruby/css/parser"

require_relative "ruby/css/tokenizer"

require_relative "ruby/css/syntax_error"
    class << self
      # TODO: Deprecate this method ahead of 2.0 and delete it in 2.0.
      # It is not used by Nokogiri and shouldn't be part of the public API.
      def parse(selector) # :nodoc:
        unless ENV['ENABLE_DEPRECATED'] == 'true'
          raise RuntimeError, "Nokogiri::CSS.parse is deprecated and cannot be used unless ENABLE_DEPRECATED is set to 'true'."
        end
        warn("Nokogiri::CSS.parse is deprecated and will be removed in a future version of Nokogiri. Use Nokogiri::CSS::Parser#parse instead.")
        Parser.new.parse(selector)
      end

      # :call-seq:
      #   xpath_for(selector_list) → Array<String>
      #   xpath_for(selector_list [, prefix:] [, ns:] [, visitor:] [, cache:]) → Array<String>
      #
      # Translate a CSS selector list to the equivalent XPath expressions.
      #
      # 💡 Note that translated queries are cached by default for performance concerns.
      #
      # ⚠ Users should prefer Nokogiri::XML::Searchable#css, which is mixed into all document and
      # node classes, for querying documents with CSS selectors. This method is the underlying
      # mechanism used by XML::Searchable and is provided solely for advanced users to translate
      # \CSS selectors to XPath directly.
      #
      # Also see Nokogiri::XML::Searchable#css for documentation on supported CSS selector features,
      # some extended syntax that Nokogiri supports, and advanced CSS features like pseudo-class
      # functions.
      #
      # [Parameters]
      # - +selector_list+ (String)
      #
      #   The CSS selector to be translated into XPath. This is always a String, but that string
      #   value may be a {selector list}[https://www.w3.org/TR/selectors-4/#grouping] (see
      #   examples).
      #
      # [Keyword arguments]
      # - +prefix:+ (String)
      #
      #   The XPath expression prefix which determines the search context. See Nokogiri::XML::XPath
      #   for standard options. Default is +XPath::GLOBAL_SEARCH_PREFIX+.
      #
      # - +ns:+ (Hash<String ⇒ String>, nil)
      #
      #   Namespaces that are referenced in the query, if any. This is a hash where the keys are the
      #   namespace prefix and the values are the namespace URIs. Default is +nil+ indicating an
      #   empty set of namespaces.
      #
      # - +visitor:+ (Nokogiri::CSS::XPathVisitor)
      #
      #   Use this XPathVisitor object to transform the CSS AST into XPath expressions. See
      #   Nokogiri::CSS::XPathVisitor for more information on some of the complex behavior that can
      #   be customized for your document type. Default is +Nokogiri::CSS::XPathVisitor.new+.
      #
      #   ⚠ Note that this option is mutually exclusive with +prefix+ and +ns+. If +visitor+ is
      #   provided, +prefix+ and +ns+ must not be present.
      #
      # - +cache:+ (Boolean)
      #
      #   Whether to use the SelectorCache for the translated query to ensure that repeated queries
      #   don't incur the overhead of re-parsing the selector. Default is +true+.
      #
      # [Returns] (Array<String>) The equivalent set of XPath expressions for +selector_list+
      #
      # *Example* with a simple selector:
      #
      #   Nokogiri::CSS.xpath_for("div") # => ["//div"]
      #
      # *Example* with a compound selector:
      #
      #   Nokogiri::CSS.xpath_for("div.xl") # => ["//div[contains(concat(' ',normalize-space(@class),' '),' xl ')]"]
      #
      # *Example* with a complex selector:
      #
      #   Nokogiri::CSS.xpath_for("h1 + div") # => ["//h1/following-sibling::*[1]/self::div"]
      #
      # *Example* with a selector list:
      #
      #   Nokogiri::CSS.xpath_for("h1, h2, h3") # => ["//h1", "//h2", "//h3"]
      #
      def xpath_for(
        selector, options = nil,
        prefix: options&.delete(:prefix),
        visitor: options&.delete(:visitor),
        ns: options&.delete(:ns),
        cache: true
      )
        unless options.nil?
          warn("Nokogiri::CSS.xpath_for: Passing options as an explicit hash is deprecated. Use keyword arguments instead. This will become an error in a future release.")
        end

        raise(TypeError, "The provided selector #{selector.inspect} cannot be converted to a String. Ensure the input is a valid string.") unless selector.respond_to?(:to_str)

        selector = selector.to_str
        raise(Nokogiri::CSS::SyntaxError, "CSS selector cannot be empty. Please provide a valid string for the selector.") if selector.empty?

        if visitor
          raise ArgumentError, "Cannot provide both :prefix and :visitor. These arguments are mutually exclusive. Please choose one." if prefix
          raise ArgumentError, "Cannot provide both :ns and :visitor. These arguments are mutually exclusive. Please choose one." if ns
        end

        visitor ||= begin
          visitor_kw = {}
          visitor_kw[:prefix] = prefix if prefix
          visitor_kw[:namespaces] = ns if ns

          Nokogiri::CSS::XPathVisitor.new(**visitor_kw)
        end

        if cache
          key = SelectorCache.key(selector: selector, visitor: visitor)
          SelectorCache[key] ||= Parser.new.xpath_for(selector, visitor)
        else
          Parser.new.xpath_for(selector, visitor)
        end
      end
    end
  end
end


