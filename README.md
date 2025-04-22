# Get::Smart

Get Smart is a Rails gem, that shows you tips and tricks to help you get the most out of your Rails application.

Every time you boot your Rails application, Get Smart will show you a tip on different topics.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "get-smart"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install get-smart
```

## Options

```ruby
Get::Smart.setup do |config|
  # Enable or disable Get::Smart. Default: Rails.env.development?
  config.enabled = Rails.env.development?

  # Paths to scan for tip files. Default:
  # config.paths += [Rails.root.join('custom-path')]

  # Frequency for showing tips. Default: :always
  config.frequency = :always
  # Available options:
  #   :always, :half_hourly, :hourly, :every_two_hours, :every_three_hours,
  #   :every_four_hours, :every_five_hours, :every_six_hours, :every_seven_hours,
  #   :every_eight_hours, :every_nine_hours, :every_ten_hours, :every_eleven_hours,
  #   :every_twelve_hours, :daily, :every_two_days, :weekly,

  # Path to the memory file. Default: ~/.get-smart-memory
  # config.memory_file_path = File.expand_path("~/.get-smart-memory")
end
```

## Development

```bash
# set OPENAI_API_KEY in .env, it can be used in bin/generator to create new tips. See source of bin/generator for more details.

# in the root of the project
cd spec/dummy
bundle install --gemfile /Users/igor/projects/get-smart/Gemfile
rails c

# or in the root of the project

bin/run
```

To run specs:

```bash
# in the root of the project
rspec
```

Linting:

```bash
bin/rubocop -f github
# to fix errors automatically
bin/rubocop -A
```

## Generator

Using Open AI API to generate tips (see example below in the readme, in #structure-of-the-files).

```bash
bin/generator <topic> <path> <count> <level>
```

Example:

```bash
bin/generator "ruby on rails security tips & tricks" "rails/security" 10 "middle"
```

## Tree (in Rails app)

```bash
bin/rails get_smart:tree
```

To see the stats about the tips.


## Structure of the files

All content is stored in the `files` folder.

Every file is a tip on a specific topic, must be named like `topic1.md`, `topic2.md`, etc.

Every tip must start with a special comment with the tip title, for example:

```ruby
### 💎 Ruby Gem Tip: Generate Clean URLs Easily with `babosa`
```

Put file in any of the folder "<folder>/<beginner|middle|advanced|expert>/<tip_title>.md"

Rules:

- Beginner - tips for beginners
- Middle - tips for middle level developers
- Advanced - tips for advanced developers
- Expert - tips for expert developers

You can use CLI to add new folders for topics:

```bash
bin/new gems/devise
```

Example:

Change the topic to "file compression in ruby" and specify number of tips to generate for each level.

```bash
bundle exec bin/generator "file compression in ruby beginner usage examples"          "files/ruby/compression"         2 "beginner"
bundle exec bin/generator "file compression in ruby middle usage examples"            "files/ruby/compression"         2 "middle"
bundle exec bin/generator "file compression in ruby advanced usage examples"          "files/ruby/compression"         2 "advanced"
bundle exec bin/generator "file compression in ruby expert usage examples"            "files/ruby/compression"         2 "expert"
```



To create folders in files/gems/devise folders (beginner, middle, advanced, expert).

## Tasks

- prepare list of topics
- option to configure level for showing tips, allow multiple levels
- create initializer generator
- AI to generate files
- readme updates, how to use, options, how to contribute, links to other repos
- tips specific to the project (based on Gemfile, package.json, DB, etc)

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
