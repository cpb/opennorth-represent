Feature: The public interface documented in the README

  @disable-bundler
  Scenario: First installation using Bundler
    Given a file named "Gemfile" with:
    """
    gem "opennorth-represent", path: "../../"
    """
    And a file named "example.rb" with:
    """
    require 'opennorth/represent'

    service = Opennorth::Represent.new

    postal_code = service.postal_codes.get("V6H2V4") # or your own postal code

    member_of_parliament = postal_code.representatives.where(elected_office: "MP").first
    hill_office = member_of_parliament.offices.where(type: "legislature").first

    puts "To: #{member_of_parliament.honorific_prefix} #{member_of_parliament.name}"
    puts "#{hill_office.postal}"
    puts
    puts "Dear, #{member_of_parliament.name}"
    puts
    puts "My message goes here"
    puts
    puts "Yours truly,"
    puts "A constituent"
    """
    And I run `bundle install > /dev/null`
    When I successfully run `bundle exec ruby example.rb` for up to 6 seconds
    Then the output should contain:
    """
    To: Hon. Hedy Fry
    House of Commons
    Ottawa On  K1A 0A6

    Dear, Hedy Fry

    My message goes here

    Yours truly,
    A constituent
    """
