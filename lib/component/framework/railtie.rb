
# Monkeypatch Rails::Application to remove components tests from application's eager load.
class Rails::Application

  # method adopted from Rails::Engine.eager_load!
  def eager_load!
    config.eager_load_paths.each do |load_path|
      matcher = /\A#{Regexp.escape(load_path.to_s)}\/(.*)\.rb\Z/
      Dir.glob("#{load_path}/**/*.rb")
          .reject { |p| p.include?("/test/") }
          .sort.each do |file|
        require_dependency file.sub(matcher, '\1')
      end
    end
  end
end
