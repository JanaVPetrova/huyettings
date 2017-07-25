require 'yaml'
require 'erb'

class Huyettings
  VERSION = '0.1.0'

  attr_reader :filepath, :env

  def initialize(filepath, env)
    @filepath = filepath
    @env = env
  end

  def method_missing(method, *_args)
    env_settings[method.to_s]
  end

  private

  def env_settings
    @env_settings ||= full_settings[env.to_s]
  end

  def full_settings
    @full_settings ||= YAML::load(ERB.new(File.read(filepath)).result)
  end
end
