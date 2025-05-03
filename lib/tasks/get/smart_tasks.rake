namespace :get_smart do
  desc "Print tree of all topics as tree"
  task tree: :environment do |_t, args|
    Get::Smart::Topics.print_tree
  end
end
