class baseicinga::server {
 # include baseicinga::server::perl_modules
  include baseicinga::server::commands
  include baseicinga::server::contacts
  include baseicinga::server::hostgroups
  include baseicinga::server::services
  include baseicinga::server::timeperiods
  ::Icinga::Resource <<||>>
}
