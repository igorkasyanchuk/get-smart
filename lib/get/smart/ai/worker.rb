require "openai"
require "colorize"

module Get::Smart
  module Ai
    class Worker
      attr_reader :topic, :count, :level

      def initialize(topic, count: 3, level: "all")
        @topic = topic
        @count = count
        @level = level
      end

      def call
        tips = response["tips"] || response
        tips.each do |tip|
          # https://github.com/fazibear/colorize/blob/master/lib/colorize/class_methods.rb
          puts
          puts
          print "[#{tip["filename"].to_s}]".on_magenta.black
          print " - "
          print "[#{tip["level"].to_s}]".blue
          puts
          puts
          puts TTY::Markdown.parse(tip["content"], indent: 0)

          File.write(File.expand_path("../../../../../tmp/#{tip["filename"].to_s}.md", __FILE__), tip["content"])
        end
        puts
      rescue => e
        puts "==" * 40
        puts response
        puts "==" * 40
        raise e
      end

      def response
        @response ||= begin
          res = client.chat(
            parameters: {
              # https://platform.openai.com/docs/pricing
              model: "gpt-4.1-mini",
              messages: [
                { role: "assistant", content: instructions },
                { role: "user", content: prompt }
              ],
              temperature: 1,
              response_format: { type: "json_object" }
            }
          )
          JSON.parse(res.dig("choices", 0, "message", "content"))
        end
      end

      def prompt
        <<~PROMPT
          <TOPIC>#{topic}</TOPIC>
        PROMPT
      end

      def instructions
        <<~INSTRUCTIONS
          You are a helpful assistant that can create a short and useful tip for a Ruby on Rails developers.

          The tip should be short and to the point, and should be in the following format:

          #{examples}

          Requirements:
          - you must follow only the provided value of <TOPIC> and requirements. Dont add information outside the <TOPIC>.
          - you can use different emojis to make the tip more engaging in the title of the tip (first sentence).
          - add 2 spaces after emoji. So it will be like this: `:emoji:  tip title`.
          - include examples of the tip in the tip.
          - add new line before code block.
          - always use uniq "filename" value for each tip in the JSON. Do not repeat the same value of "filename".
          - use filename as a filename for the tip.
          - always reply in JSON format with markdown content.
          - use examples above for reference.
          - keep tips short, but useful. You can add more examples if needed to explain the tip.
          - specify programming language of the code in the tip.
          - create at least #{count} tips. If count is 0 - create as many tips as you can.
          - create tips for #{level} level. If specified level is "all", create tips for all levels.
          - level must be any of "any", "beginner", "middle", "advanced".
            - "beginner" level is for beginners who are just starting to learn Ruby on Rails.
            - "middle" level is for developers who have some experience with Ruby on Rails. Include complex code snippets.
            - "advanced" level is for experienced developers who are proficient in Ruby on Rails. Include strong and advanced code snippets.
            - "any" level is for any level of developers with just useful tips. If tips is basic - just use "beginner" level.
          - try to include more middle and advanced tips, so developers can learn something new.
          - do not send level in the content.

          You must follow the requirements above and return only valid JSON object.
        INSTRUCTIONS
      end

      def examples
        examples = [
          {
            "filename": "string_interpolation",
            "content": File.expand_path("../../../../../spec/files/other/any/file1.md", __FILE__),
            "level": "any"
          },
          {
            "filename": "string_squeeze",
            "content": File.expand_path("../../../../../spec/files/other/any/file2.md", __FILE__),
            "level": "middle"
          }
        ]

        <<~EXAMPLES
          Example 1:
          ```json
          #{{ tips: examples }.to_json}
          ```
        EXAMPLES
      end

      private

      def client
        @client ||= OpenAI::Client.new(
          access_token: ENV["OPENAI_API_KEY"],
          log_errors: true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production because it could leak private data to your logs.
        )
      end
    end
  end
end
