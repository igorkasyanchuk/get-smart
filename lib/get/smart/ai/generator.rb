require "openai"
require "colorize"

module Get::Smart
  module Ai
    class Generator
      attr_reader :topic, :count, :level, :folder

      def initialize(topic, count: 10, level: "all", folder:)
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
          # for development & testing
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
              # https://platform.openai.com/docs/models
              model: "o4-mini",
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
        You are a helpful assistant that generates concise, practical Ruby on Rails tips in JSON format.

        <GOAL>
          Your goal is to generate #{count} tips for the given topic with the following level: #{level}.
        </GOAL>

        Requirements:
        - Input: a single `<TOPIC>...</TOPIC>` tag specifying the focus.
        - Output: a JSON object matching this schema:
          {
            "tips": [
              {
                "filename": "unique_string",
                "content": "markdown_tip",
                "level": "beginner" | "middle" | "advanced" | "expert"
              },
              ...
            ]
          }
        - For each tip object:
          - **filename**: a unique, descriptive identifier (no duplicates).
          - **content**: markdown starting with a level-2 heading:
            `## {emoji} Tip Title`
            - Use a Unicode emoji followed by a space before the title.
            - Write a description (why, what, and how; 2-4 sentences or even more if needed) and include one or more code examples.
            - Add a blank line before each code block.
            - Specify the language for every code block.
            - send complete tip, not just code, make sure it is including all the information needed to implement the tip
          - **level**: one of `"beginner"`, `"middle"`, `"advanced"`, or `"expert"`, indicating the target audience.
        - Control tip count and levels:
          - Generate at least **{count}** tips. If `count` is 0, generate as many as you can.
          - If `level` is `"all"`, include tips across all levels; otherwise, only that level.
          - Favor towards more advanced tips to challenge experienced developers if `level` is not specified.
          - for "expert" level add super complex, strong, advanced tips, for developers with 8+ years of experience.
          - when "level" is specified, generate only that level of tips. For example, if level is "expert", generate only expert tips.
        - Keep tips short, actionable, and focused strictly on the provided topic.
        - Do not include any extra fields or properties.
        - Return only the JSON object—no additional text or commentary.
        - You must follow the examples and instructions strictly.

        <EXAMPLES>
          #{examples}
        </EXAMPLES>
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
                        enum: [ "beginner", "middle", "advanced", "expert" ],
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
            "content": File.expand_path("../../../../../spec/files/other/middle/file1.md", __FILE__),
            "level": "advanced"
          },
          {
            "filename": "string_squeeze",
            "content": File.expand_path("../../../../../spec/files/other/middle/file2.md", __FILE__),
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
