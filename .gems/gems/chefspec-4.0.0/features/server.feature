# Need to spawn a sub-process; otherwise future tests will fail because the
# server is running
@spawn
Feature: The ChefSpec server
  Background:
    * I am using the "server" cookbook

  Scenario Outline: Running specs
    * I successfully run `rspec spec/<Compontent>_spec.rb`
    * the output should contain "0 failures"
  Examples:
    | Compontent         |
    | client             |
    | data_bag           |
    | environment        |
    | node               |
    | render_with_cached |
    | role               |
    | search             |
