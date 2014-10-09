class baseicinga::client {
  include baseicinga::client::firewall
  include baseicinga::client::basic_checks
  include baseicinga::client::nrpe_commands
}
