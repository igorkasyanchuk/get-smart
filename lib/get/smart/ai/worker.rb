require "openai"
require "colorize"

module Get::Smart
  module Ai
    class Worker
      attr_reader :topic, :count, :level, :folder

      def initialize(topic, count: 3, level: "all", folder:)
        @topic = topic
        @count = count
        @level = level
        @folder = folder
      end

      def call
        tips = response["tips"] || response
        tips.each do |tip|
          # https://github.com/fazibear/colorize/blob/master/lib/colorize/class_methods.rb
          5.times { puts }
          print "[#{tip["filename"]}]".on_magenta.black
          print " - "
          print "[#{tip["level"]}]".blue
          2.times { puts }
          puts TTY::Markdown.parse(tip["content"], indent: 0)
          2.times { puts }
          # for development
          # File.write(File.expand_path("../../../../../tmp/#{tip["filename"].to_s}.md", __FILE__), tip["content"])

          # for production
          file_path = "#{folder}/#{tip["level"]}/#{tip["filename"]}.md"
          puts "Writing to #{file_path}".on_yellow.black
          File.write(File.expand_path(file_path, __FILE__), tip["content"])
        end
        puts
        puts "Created #{tips.count} tips".green
        puts "Done!".green
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
              model: "gpt-4.1-mini",
              temperature: 1,
              messages: [
                { role: "assistant", content: instructions },
                { role: "user", content: prompt }
              ],
              response_format: response_format
            }
          )
        end

        JSON.parse(res.dig("choices", 0, "message", "content"))
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
          - add a space after emoji. So it will be like this: `:emoji: tip title`.
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
          - do not send level in the content body, but always send it in the JSON.
          - format for beginning of the content is "## :emoji: tip title"
          - you are allowed to include many code blocks in the content, but provide language for each code block, and add a new line before each code block.
          - send only working code snippets

          You must follow the requirements above and return only valid JSON object with valid schema.
        INSTRUCTIONS
      end

      # Open AI JSON Schema
      def response_format
        {
          type: "json_schema",
          json_schema: {
            name: "tips",
            strict: true,
            schema: {
              type: "object",
              properties: {
                tips: {
                  type: "array",
                  items: {
                    type: "object",
                    properties: {
                      filename: {
                        type: "string",
                        description: "unique filename to store on disk, about content inside"
                      },
                      content: {
                        type: "string",
                        description: "tip content, in markdown format"
                      },
                      level: {
                        type: "string",
                        enum: [ "any", "beginner", "middle", "advanced" ],
                        description: "level of the tip for the target audience"
                      }
                    },
                    required: [ "filename", "content", "level" ],
                    additionalProperties: false
                  }
                }
              },
              required: [ "tips" ],
              additionalProperties: false
            }
          }
        }
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
          request_timeout: 300,
          log_errors: true # Highly recommended in development, so you can see what errors OpenAI is returning. Not recommended in production because it could leak private data to your logs.
        )
      end
    end
  end
end
