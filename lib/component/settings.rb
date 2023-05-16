
INCLUDE_KEY = "__include__"


module Component

  module Settings

    # Loads settings YAML and returns hash with settings names/values
    #
    # In case {name}.override.yml file present, its content merged on top of settings file.
    #
    # Adapted from Rails.application.config_for()
    # YAML format key:env:value
    #
    # @param name [String] settings file name.
    # @param env [String] environment name, by default Rails.env will be used.
    def self.load_settings(name, env: nil)
      env ||= Rails.env
      settings = _load_settings_file(name, env)
      if settings.nil?
        raise "Could not load configuration. No such file - #{name}.yml"
      end

      overrides = _load_settings_file(name.to_s + ".override", env)
      if overrides.present?
        settings.deep_merge!(overrides)
      end

      settings.with_indifferent_access.freeze
    end


    def self._load_settings_file(name, env)
      yaml_file = Pathname.new("#{Rails.application.paths["config"].existent.first}/#{name}.yml")

      if yaml_file.exist?
        require "erb"

        processed_yaml = ERB.new(yaml_file.read).result
        # Psych v4+ defaulted .load to safe_load and break aliases support in config files
        yaml = YAML.respond_to?(:unsafe_load) ? YAML.unsafe_load(processed_yaml) : YAML.load(processed_yaml)
        yaml ||= {}

        result = yaml.map { |k, v| [k, v[env] || {}] }.to_h

        return result
      else
        return nil
      end
    rescue Psych::SyntaxError => e
      raise "YAML syntax error occurred while parsing #{yaml_file}. " \
            "Please note that YAML must be consistently indented using spaces. Tabs are not allowed. " \
            "Error: #{e.message}"
    end

  end
end
