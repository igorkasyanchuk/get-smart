## ⚙️ Custom Tag List Delimiters and Unicode Normalization
By default, ActsAsTaggableOn splits tags on commas. For advanced multilingual apps, you can override the parser to use custom delimiters (e.g., semicolons) and normalize Unicode characters to NFKC for consistency across languages.

Create an initializer to override the tag parser:

```ruby
# config/initializers/tag_list_parser.rb
module ActsAsTaggableOn
  module Utils
    class DefaultParser
      def parse(tags)
        tags.to_s
            .mb_chars
            .normalize(:kc)      # Unicode NFKC normalization
            .to_s
            .split(/[;,]/)       # split on semicolon or comma
            .map(&:strip)
            .reject(&:blank?)
            .uniq
      end
    end
  end
end
```

Now tagging with semicolons or commas works seamlessly:

```ruby
event.tag_list = "Summer; 春; été, verano"
event.save
# => ["Summer", "春", "été", "verano"]
```