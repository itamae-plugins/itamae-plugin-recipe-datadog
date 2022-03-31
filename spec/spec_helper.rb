require "serverspec"
require "docker"
require "yaml"
require "itamae"

set :backend, :docker

set :docker_image, ENV['DOCKER_IMAGE']
set :docker_container, ENV['DOCKER_CONTAINER']

# Disable sudo
# set :disable_sudo, true


# Set environment variables
# set :env, :LANG => 'C', :LC_MESSAGES => 'C'

# Set PATH
# set :path, '/sbin:/usr/local/sbin:$PATH'

def node
  return @node if @node

  hash = YAML.load_file("#{__dir__}/recipes/node.yml")

  @node = Itamae::Node.new(hash, Specinfra.backend)
end
