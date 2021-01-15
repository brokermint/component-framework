module Component::Framework

  class ScssTemplate < SassC::Rails::ScssTemplate

    def config_options
      options = super
      options[:importer] = Component::Framework::SassImporter
      return options
    end

  end


  class SassImporter < SassC::Rails::Importer

    def imports(path, parent_path)
      return _import_components if path == "{all-components}"
      super
    end


    private


    def _import_components
      context = options[:sprockets][:context]
      _component_manifest_files.map do |filename|
        context.depend_on(filename)
        SassC::Importer::Import.new(filename)
      end
    end


    def _component_manifest_files
      Dir.glob(Component::Framework.components_base_dir.join("**/assets/stylesheets/app.scss")).sort
    end

  end
end
