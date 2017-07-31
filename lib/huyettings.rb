require 'yaml'
require 'erb'

class Huyettings
  VERSION = '0.3.0'.freeze

  attr_reader :filepath, :env

  def initialize(filepath, env)
    @filepath = filepath
    @env = env
  end

  def method_missing(method, *_args)
    env_settings[method.to_sym]
  end

  private

  def env_settings
    @env_settings ||= full_settings[env.to_sym]
  end

  def full_settings
    key_symbolizer(YAML.load(ERB.new(File.read(filepath)).result))
  end

  def key_symbolizer(hash)
    hash.each_with_object({}) do |(key, value), memo|
      if value.is_a? Hash
        memo[key.to_sym] = key_symbolizer(value)
      else
        memo[key.to_sym] = value
      end
    end
  end
end
