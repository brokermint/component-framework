
class Component::Framework::DirectiveProcessor < Sprockets::DirectiveProcessor

  # `require_components` requires all the components manifest files in project.
  #
  #  //= require_components assets/javascripts/app.js
  #  will be resolved to {COMPONENT_BASE_DIR}/{COMPONENT_NAME}/assets/javascripts/app.js

  def process_require_components_directive(manifest_subpath = "assets/javascripts/app.js")

    # gather component manifests with absolute paths.
    manifests_paths = Component::Framework.get_component_names
                          .map {|name| Component::Framework.components_base_dir.join(name, manifest_subpath).to_s}
                          .select { |path| File.exist?(path) }
                          .sort  # add predictability to require order

    manifests_paths.each { |path| @required << _resolve_absolute(path, accept: @content_type, pipeline: :self) }
  end


  private


  def _resolve_absolute(path, options = {})
    # adapted from Sprockets::DirectiveProcessor.resolve
    uri, deps = @environment.resolve!(path, options.merge(base_path: @dirname))
    @dependencies.merge(deps)
    uri
  end

end
