## ⚙️ Atomic Directory Updates Using Temporary Directories

For zero-downtime deployments or safe configuration updates, stage changes in a temp directory and then atomically swap it with `File.rename`. This ensures consumers never see a half-written state.

```ruby
require 'fileutils'
require 'tmpdir'

def atomic_update(target_dir)
  Dir.mktmpdir(File.basename(target_dir), File.dirname(target_dir)) do |tmp|  
    tmp_path = Pathname.new(tmp)
    # Stage new files
    FileUtils.cp_r('build/output/.', tmp_path)

    # Optionally set permissions or post-process
    tmp_path.children.each { |p| FileUtils.chmod(0o644, p) if p.file? }

    # Atomic swap: move old out, bring new in
    backup = "#{target_dir}.bak"
    FileUtils.rm_rf(backup)
    FileUtils.mv(target_dir, backup)
    FileUtils.mv(tmp_path, target_dir)

    # Cleanup backup if all good
    FileUtils.rm_rf(backup)
  end
end

# Usage
atomic_update('/var/www/my_app/shared/config')
```  
By leveraging `Dir.mktmpdir` and `FileUtils.mv`, you guarantee either the old directory or the new one is fully in place, avoiding partial states and ensuring rollback on failure.