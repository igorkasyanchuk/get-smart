require "faraday"
require "json"
require "active_support/all"
require "colorize"
module Get::Smart
  module Ai
    class Verifier
      class GeminiClient
        BASE_URL = "https://generativelanguage.googleapis.com/v1beta/models/"
        DEFAULT_MODEL = "gemini-2.0-flash"
        TEMPERATURE = 1.0

        attr_reader :model

        def initialize(model: DEFAULT_MODEL)
          @model = model
        end

        def call(instructions:, prompt:, temperature: TEMPERATURE)
          Faraday.post("#{BASE_URL}#{model}:generateContent?key=#{ENV.fetch("GEMINI_API_KEY")}") do |req|
            req.headers["Content-Type"] = "application/json"
            req.body = {
              "contents": [ {
                "parts": [ { "text": prompt } ]
              } ],
              "generationConfig": {
                "response_mime_type": "application/json",
                "temperature": temperature,
                "maxOutputTokens": 30000,
              },
              "system_instruction": {
                "parts": [ {
                  "text": instructions
                } ]
              },
            }.to_json
          end
        end
      end

      attr_reader :folder
      def initialize(folder:)
        @folder = folder
      end

      def call
        files = Dir.glob("#{folder}/**/*.md")
        files.each do |file|
          begin
            content = File.read(file)
            response = GeminiClient.new.call(instructions: instructions, prompt: content)
            json = JSON.parse(JSON.parse(response.body).dig("candidates", 0, "content", "parts", 0, "text"))
            score_txt = json["score"].to_i >= 8 ? json["score"].to_i.to_s.green : json["score"].to_i.to_s.red
            puts "#{file}:   #{score_txt}" + (json["details"].present? ? "  #{json["details"]}".yellow : "")
            sleep 0.1
            if File.size(file) < 10
              puts "#{file}:   DELETING, size: #{File.size(file)}"
              File.delete(file)
            end
          rescue JSON::ParserError => e
            puts "#{file}:   SKIP"
          end
        end
      end

      def instructions
        <<~INSTRUCTIONS
          You are a helpful expert in Ruby and Rails, full stack developer with knowledge of Ruby, Rails, HTML, CSS, JavaScript, SQL, Git, and other related technologies.
          Your role is to verify content of the useful tips for Ruby and Rails developers.
          You need to rate the content of the tip from 1 to 10 in order to determine if it is working, useful and helpful for Ruby and Rails developers.
          When 10 is the highest score, it means that the tip is working, useful and helpful for Ruby and Rails developers.
          When 1 is the lowest score, it means that the tip is not working, not useful and not helpful for Ruby and Rails developers.
          You need to return only the score from 1 to 10.
          If file is empty, or no tip return 0.
          If something is wrong with the tip return details about what is wrong and how to fix it, but keep short.

          Example of response:

          ```json
          {
            "score": 10
          }
          ```

          or

          ```json
          {
            "score": 1,
            "details": "The tip is not working, not useful and not helpful for Ruby and Rails developers."
          }
          ```

          Only reply in JSON format.
        INSTRUCTIONS
      end
    end
  end
end
