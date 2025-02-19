CHANGELOG for ChefSpec
======================

## 3.3.2 (March 16, 2014)
Bugfixes:
  - Restore Berkshelf 2 support (missing edge case)
  - Add negative failure message for subscribes/notifies matchers

Features:
  - Added `do_nothing` matcher for asserting a resource performed no actions

Improvements:
  - Increased spec coverage for matchers
  - Support RSpec matchers in `with_content`

## 3.3.1 (March 11, 2014)
Bugfixes:
  - Various typographical fixes in the README
  - Remove unused JSON report
  - Restore coverage reporting for Berkshelf 2 users
  - Minor formatting changes for errors

Improvements:
  - Remove dependency on i18n and use native ERB instead
  - Vendor Berkshelf/Librarian in a "cookbooks" directory so we can shorten the pathname during coverage reporting

## 3.3.0 (March 9, 2014)
Bugfixes:
  - Update documentation for setting `automatic` attributes
  - Update documentation for stubbing data_bags
  - Use a non-internal RSpec variable name for expecting exceptions
  - Fix the airity of the `stub_node` method

Improvements:
  - Better filtering protocols for resource coverage

## 3.2.0 (January 31, 2014)
Bugfixes:
  - Fix coverage calculation when there are no resources in the collection
  - Fix misplaced quote in matcher output
  - Include all files in generated gem
  - Ensure compatability with Chef HEAD

Improvements:
  - Test Ruby 2.1 on Travis
  - Miscellaneous README typos
  - Add `subscribe_to` matchers
  - Add documentation for the `with` matcher
  - Add support for passing a `node` object directly to the server `create_node` method

## 3.1.4 (January 3, 2014)
Bugfixes:
  - Correctly expand the node's run_list in server mode
  - Actually package i18n translations with the cookbook

Improvements:
  - Document setting a node's role
  - Add examples and features for `stub_node`

## 3.1.3 (January 2, 2014)
Bugfixes:
  - Fix broken deprecations module
  - Update a broken test ([@bknowles][])

Improvements:
  - Better gem description on GitHub and Rubygems
  - Helper support for template rendering (Chef 11.4+) ([@geraud][])

## 3.1.2 (December 30, 2013)
Bugfixes:
  - Require i18n 0.6.9 or higher (but less than 1.0.0) ([#289](https://github.com/sethvargo/chefspec/issues/245))

## 3.1.1 (December 29, 2013)
Bugfixes:
  - Handle duplicate resources in the coverage reporter

## 3.1.0 (December 29, 2013)
Bugfixes:
  - Only remove existing LWRP resources and providers when a new one is encountered ([@student][])
  - Attempt to coerce dashes to underscores in LWRPs
  - Various documentation fixes and typos

Improvements:
  - Don't include `deprecations` module by default
  - Add examples for stubbing commands across recipes
  - Yield a block after cookbooks are compiled but before they are converged ([@rteabeault][])
  - Add IRC Channel #chefspec
  - Raise a nice error when `cookbook_path` cannot be determined ([@ryotarai][])

Features:
  - Add support for Librarian ([@mlafeldt][])
  - Add Cacher module for caching runner results ([@sethvargo][] & [@DracoAter][])
  - Add Chef Zero (server) mode ([@sethvargo][])
  - Add basic resource reporting (Chef recipe code coverage) ([@sethvargo][])
  - Use i18n (internationalization) ([@sethvargo][])

## 3.0.2 (November 6, 2013)
Bugfixes:
  - Update links to point at new repository location
  - Deleted relish docs to remove confusion
  - Bump fauxhai dependency to 2.0 (removing the HTTParty transitive dependency)
  - Convert resource names with dashes to underscores when stepping into them

Improvements:
  - Added a "what people are saying" section to the README - if you have something cool to say about ChefSpec, let me know!
  - Add a link to [`knife-spec`](https://github.com/sethvargo/knife-spec)
  - Test against Chef 11.8
  - New matcher: `have_state_attrs` for testing custom LWRP state attributes
  - Run tests in a sandboxed parent instead of tmp (makes Travis happier)


## 3.0.1 (October 22, 2013)
Bugfixes:
  - Fix an issue where LWRPs were not properly stepped into when `use_inline_resources` was specified ([#244](https://github.com/sethvargo/chefspec/issues/244))
  - Coerce `render_file` `@expected_content` to a string before asserting if content is included ([#243](https://github.com/sethvargo/chefspec/issues/243))

Improvements:
  - Miscellaneous documentation fixes and additions ([#245](https://github.com/sethvargo/chefspec/issues/245), [#241](https://github.com/sethvargo/chefspec/issues/241), [#238](https://github.com/sethvargo/chefspec/issues/238))


## 3.0.0 (October 20, 2013)
Breaking:
  - Dropped support for Chef 9 & 10
  - Renamed `ChefSpec::ChefRunner` to `ChefSpec::Runner` to better reflect what happens in Chef Core. Using `ChefRunner` will throw deprecation errors for now and will be removed in a future release.
  - Removed MiniTest Chef Handler examples/matchers
  - No longer load default cookbook paths:
    - vendor/cookbooks
    - test/cookbooks
    - test/integration (test kitchen)
    - spec/cookbooks
  - Resource matchers all follow the pattern "(action)_(resource_name)". ChefSpec will warn you of these deprecations in 3.0. They will be removed in 4.0. However, some resources cannot be automatically converted - **these resources will raise a deprecation exception of `ChefSpec::NoConversionError`**. The following matchers have changed:
    - `execute_command` => `run_execute`
    - `set_service_to_start_on_boot` => `enable_service`
    - `create_file_with_content` => `render_file`
    - `execute_(script)` => `run_(script)`
    - `execute_ruby_block` => `run_ruby_block`
    - `install_package_at_version` => `install_package().with(version: '')`
    - `*_python_pip` => (removed - see "Packaging Custom LWRPs in the README")
  - Remove dependency on Erubis
  - Remove dependency on MiniTest Chef Handler
  - Remove development dependency on Cucumber
  - Remove development dependency on i18n
  - Remove development dependency on simplecov
  - Separate package matchers. In prior versions of ChefSpec, the `package` matcher would match on any kind of package and any kind of package action. However, some subclasses of the package resource do not support all actions. Each package provider now has it's own matcher with only the actions it supports. Prior specs that used the generic `package` matcher will no longer match on subclasses - you must use the specific subclass matcher.
  - Separate file/cookbook_file/template matchers. In prior versions of ChefSpec, the `file` matcher would match on `file`, `cookbook_file`, and `template`. This is not ideal because it doesn't verify the correct message was sent. Now, `file`, `cookbook_file`, and `template` matchers will _only_ match resources of that type. For generic file checking, please use the new `render_file` matcher.
  - Guards are now evaluated by default. If a shell guard is executed, it must first be stubbed with the `stub_command` macro.
  - `Runner#resources` converted from an Array to a Hash. This is to ensure that all resource actions are added (when multiple calls to run_action exist (#201)). This also drastically improves resource lookup times.
  - `Resource#actions` is no longer maniuplated. Instead, a new method `Resource#performed_actions` now keeps track of the actions taken on a resource (as well as the phase in which they were taken), preserving the original state of the resource.

Features:
  - Added a new `render_file` action to replace `create_file_with_content`. This matcher will render the contents of any file to a string and then optionally compare the result if given a `with` chainable.
  - All resources now accept a `with` chainable for matching specific resource attributes.
  - Windows attributes are now testable on non-Windows systems (like `inherits`)
  - Added `batch` resource matchers
  - Added `cookbook_file` resource matchers
  - Added `deploy` resource matchers
  - Added `erl_call` resource matchers
  - Added `git` resource matchers
  - Added `http_request` resource matchers
  - Added `ifconfig` resource matchers
  - Normalized `link` resource matchers
  - Added `log` resource matchers
  - Added `mdadm` resource matchers
  - Added `mount` resource matchers
  - Added `:immediate` and `:delayed` notification matchers
  - Added `ohai` resource matchers
  - Added `powershell_script` matchers (Chef 11.6+)
  - Added `registry_key` matchers
  - Added `remote_directory` matchers
  - Added `route` matchers
  - Added `subversion` matchers
  - Added `stub_command` macro (formerly on `ChefSpec::ChefRunner`) for stubbbing the results of shell commands. Because shell commands are evaluated by default, ChefSpec will raise an exception when encountering a shell command that has not been stubbed.
  - Added `stub_search` macro for easily stubbing `search` calls. Like shell commands, ChefSpec will raise an exception when encountering a `search` call that has not been stubbed.
  - Added `stub_data_bag` macro for easily stubbing `data_bag` calls. Like shell commands, ChefSpec will raise an exception when encountering a `data_bag` call that has not been stubbed.
  - Added `stub_data_bag_item` macro for easily stubbing` data_bag_item` calls. Like shell commands, ChefSpec will raise an exception when encountering a `data_bag_item` call that has not been stubbed.
  - Added `stub_node` helper for quickly generating a node object from Fauxhai data
  - Added `ChefSpec::Runner#apply` command to mimic the behavior of `chef-apply` (use with caution)
  - Share the `ChefSpec::Runner` object with the Node object
  - Add `chefspec/berkshelf` for easily integrating specs with Berkshelf (2 & 3)
  - Add `.at_compile_time` and `.at_converge_time` matchers for asserting which phase of the Chef run a resource should be run

Improvements:
  - Move to inline documentation (Yard)
  - Implement InProcess Aruba testing for ultra-fast tests
  - Create "examples" directory for testing and demonstration
  - Unified all failure_messages_for_should
  - Use `shared_examples` for easily testing defined custom matchers
  - Infer the `cookbook_path` from the calling spec
  - Directly set node attributes with Fauxhai (formerly this was an O(n) operation)
  - Refactored ExpectExpectation to work without stubbing
  - Use Chef's `resource_collection` to identify resources instead of our own custom proxy


## 2.0.1 (August 28, 2013)

Bugfixes:

  - Add missing second optional parameter to `Hash#respond_to?` monkey patch

Features

  - Improve error message when using a regular express
  - Improve documentation for Python packages

## 2.0.0 (August 22, 2013)

Breaking:

  - Remove support for REE ([@andrewgross][] for the CI)

Bugfixes:

  - Better failure message for `create_remote_file` ([@tmatilai][])
  - Add `cookbook_file` as an accepted type to the `create_file` matchers ([@dafyddcrosby][])
  - Ensure formatter is only registered once ([@student][])
  - Signifant README updates ([@phoolish][])
  - Fix `described_recipe` helper (S.R.Garcia)
  - Refactor Chef 10/11 template rendering ([@sethvargo][])
  - Fix CI ([@sethvargo][])
  - Match File actions as an array ([@sethvargo][])

Features:

  - Extend `ruby_block` matcher to accept regular expressions ([@ssimeonov][])
  - Add `create_remote_file_if_missing` matcher ([@jimhopp][])
  - Extend `execute` matcher to accept regular expressions ([@eliaslevy][])
  - Add ability to expect exceptions during a run ([@student][])
  - Add regular expression support for resource names ([@mapleoin][])
  - Add support for `python_pip` LWRP ([@mapleoin][])

## 1.3.1 (June 10, 2013)

Bugfixes:

  - Allow the user to override `cookbook_path` again

## 1.3.0 (June 6, 2013)

Features:

  - Added the ability to evaluate `only_if` and `not_if` conditional guards and
    support for stubbing shell guards (#142, #144).
  - New `described_recipe` and `described_cookbook` helpers to keep your specs
    DRY (#140). Thanks Andrey Chernih.

Bugfixes:

  - Ensure that Ohai plugin reloader works with ChefSpec (#141). Thanks Andrey
    Chernih.

## 1.2.0 (May 16, 2013)

Features:

  - Add support for partial files (@RanjibDey)
  - Automatically check certain directories for cookbooks (@sethvargo)

## 1.1.0 (May 10, 2013)

Features:

  - Upgrade to newest version of fauxhai (@tmatilai)
  - Make `find_resource` a public method (@adamhjk)
  - Add path support (from fauxhai) (@RanjibDey)
  - Custom Chef formatter for ChefSpec (removes pesky output) (@sethvargo)

Bugfixes:

  - Remove pesky output from Chef 11

## 1.0.0 (April 22, 2013)

Features:

  - Add support for matching file content using Regular Expressions (@ketan)
  - Add support for `ruby_block` matcher (Andrey Vorobiev)
  - Use Fauxhai for node attributes (see 4529c10)
  - Moved `test` and `development` into gemspec for transparency
  - Improve message logging and testing (@tmatilai)
  - Chef 11 compatibility (still Chef 10 compatible)
  - Accept and document new RSpec "expect" syntax
  - Attribute matchers for various providers (@bjoernalbers)
  - Add execute_{bash,csh,perl,python,ruby}_script matchers ([@mlafeldt][])
  - Add group and user resource matchers (@gildegoma)
  - Add support for `yum_package` (Justin Witrick)
  - Add ISSUES.md
  - Add CONTRIBUTING.md
  - Relax gemspec constraints (@juliandunn)
  - Improve documentation and examples

Bugfixes:

  - Fix Rubygems/Bundler 2.0 compatibility issues
  - Upgrade to newest RSpec
  - Fix Chef 11 incompatibility
  - Various documentation fixes

## 0.9.0 (November 10, 2012)

Features:

  - Support added for the `user` resource (#6). Thanks Ranjib Dey.
  - Support for making assertions about notifications added (#49). Thanks to
    Ranjib Dey.
  - New `include_recipe` matcher added (#50). Thanks Ranjib Dey.
  - Support added for the Windows `env` resource (#51). Thanks Ranjib Dey.
  - Convenience methods for common resources added to `ChefRunner` (#51).
    Thanks Ranjib Dey.
  - Further resource convenience methods added (#60). Thanks to Ketan
    Padegaonkar.
  - Support for the `:disable` action added to the service resource (#67).
    Thanks to Chris Lundquist.
  - Add a matcher to assert that a service is not running on boot (#58). Thanks
    to Ketan Padegaonkar.
  - Support added for the `chef_gem` resource (#74). Thanks to Jim Hopp.

Bugfixes:

  - Avoid failure if template path is not writable (#48). Thanks to Augusto
    Becciu and Jim Hopp.
  - Style fix for the README (#55). Thanks Greg Karékinian.
  - Ensure notification assertions work where the resource name contains
    brackets (#57). Thanks Sean Nolen.
  - Unit tests updated to explicitly specify attribute precedence as required
    from Chef 11 (#70). Thanks Mathias Lafeldt.
  - Documentation added to the README for the `create_remote_file` matcher
    (#71). Thanks Mathias Lafeldt.
  - Clarify that `create_file_with_content` matches on partial content (#72).
    Thanks Mathias Lafeldt.

## 0.8.0 (September 14, 2012)

Features:

  - LWRP support added (#40). You can now make assertions about the resources
    created by a provider by telling chefspec to [step into a provider
    implementation](https://github.com/sethvargo/chefspec/tree/v0.8.0#writing-examples-for-lwrps).
    Thanks to Augusto Becciu for implementing this feature.
  - Updated for compatibility with Chef 10.14. Thanks Augusto Becciu.

Bugfixes:

  - Template paths are no longer hard-coded to live under `default` (#32).
    Thanks Augusto Becciu.

## 0.7.0 (August 27, 2012)

Features:

  - Cron resource support added (#33). Thanks Alexander Tamoykin.
  - RSpec dependency
    [bumped to 2.11](https://github.com/rspec/rspec-core/blob/b8197262d143294bf849ab58d1586d24537965ab/Changelog.md)
    which has
    [named subject](http://blog.davidchelimsky.net/2012/05/13/spec-smell-explicit-use-of-subject/)
    support (#37). Thanks Doug Ireton.

Bugfixes:

  - Correctly infer the default `cookbook_path` on Windows (#38). Thanks Torben
    Knerr.

## 0.6.1 (June 21, 2012)

Features:

  - With the
    [release of Chef 10.12.0](http://www.opscode.com/blog/2012/06/19/chef-10-12-0-released/)
    the Chef versioning scheme has changed to make use of the major version
    field. The constraint on chef is now optimistic. Thanks to Robert J. Berger
    of Runa.com for flagging this issue (#28).

## 0.6.0 (May 31, 2012)

Features:

  - Service matchers extended to add support for the `:nothing` and `:enabled`
    actions. Thanks to Steve Lum (#20).
  - Added mock value for `node['languages']` to prevent failure when loading
    cookbooks that expect this attribute to have been populated by OHAI. Thanks
    to Jim Hopp (#23).
  - Matchers added for the `link` resource. Thanks to James Burgess (#25).
  - Matchers added for the `remote_file` resource. Thanks to Matt Pruitt (#26).

## 0.5.0 (February 20, 2012)

Features:

  - Thanks to Chris Griego and Morgan Nelson for these improvements:
      - Support both arrays and raw symbols for actions in the file content matcher (#14).
      - Add support for cookbook_file resources (#14).
  - Support added for `gem_package` resources. Thanks to Jim Hopp from Lookout (#16).

Bugfixes:

  - Set the client_key to nil so that Chef::Search::Query.new doesn't raise (#14). Thanks Chris Griego and Morgan Nelson.

## 0.4.0 (November 14, 2011)

Features:

  - Ruby 1.9.3 is now supported.
  - The `create_file_with_content` matcher now matches on partial content (#13). This is an API behaviour change but
  sufficiently minor and unlikely to break existing specs that I'm not bumping the major version. Thanks Chris Griego
  and Morgan Nelson from getaroom.

Bugfixes:

  - Fixed a bug in the `install_package_at_version` matcher where it would error if the package action was not
  explicitly specified (#13). Thanks Chris Griego and Morgan Nelson from getaroom.

## 0.3.0 (October 2, 2011)

Features:

  - [Added new matcher](https://www.relishapp.com/sethvargo/chefspec/docs/write-examples-for-templates) `create_file_with_content` for verifying Chef `template` resource generated content.
  - [Knife plugin](https://www.relishapp.com/sethvargo/chefspec/docs/generate-placeholder-examples) added to generate placeholder examples.

## 0.2.1 (September 21, 2011)
Bugfixes:

  - Fixed typo in 0.2.0 botched release. Pro-tip: run your tests.

## 0.2.0 (September 21, 2011)

Features:

  - Significantly improved performance by not invoking OHAI.
  - ChefRunner constructor now accepts a block to set node attributes.
  - ChefRunner constructor now takes an options hash.
  - Converge now returns a reference to the ChefRunner to support calling converge in a let block.

Bugfixes:

  - Removed LWRP redefinition warnings.
  - Reset run_list between calls to converge.
  - Readable to_s output for failed specs.

## 0.1.0 (August 9, 2011)

Features:

  - Support for Chef 0.1.x (#2)
  - Support MRI 1.9.2 (#3)

Bugfixes:

  - Added specs.

## 0.0.2 (July 31, 2011)

Bugfixes:

  - Corrected gem dependencies.

## 0.0.1 (July 31, 2011)

Initial version.

- - -
[@acrmp]: <https://github.com/acrmp> "Andrew Crump GitHub"
[@andrewgross]: <https://github.com/andrewgross> "Andrew Gross's GitHub"
[@bknowles]: <https://github.com/bknowles> "Brad Knowles's GitHub"
[@dafyddcrosby]: <https://github.com/dafyddcrosby> "Dafydd Crosby's GitHub"
[@DracoAter]: <https://github.com/DracoAter> "Juri Timošin's GitHub"
[@eliaslevy]: <https://github.com/eliaslevy> "eliaslevy's GitHub"
[@jimhopp]: <https://github.com/jimhopp> "Jim Hopp's GitHub"
[@geraud]: <https://github.com/geraud> "Geraud Boyer's GitHub"
[@mapleoin]: <https://github.com/mapleoin> "Ionuț Arțăriși's GitHub"
[@mlafeldt]: <https://github.com/mlafeldt> "Mathias Lafeldt's GitHub"
[@phoolish]: <https://github.com/phoolish> "phoolish's GitHub"
[@ranjib]: <https://github.com/ranjib> "Ranjib Dey's GitHub"
[@ryotarai]: <https://github.com/ryotarai> "Ryota Arai's GitHub"
[@rteabeault]: <https://github.com/rteabeault> "rteabeault's GitHub"
[@sethvargo]: <https://github.com/sethvargo> "Seth Vargo GitHub"
[@ssimeonov]: <https://github.com/ssimeonov> "Simeon Simeonov's GitHub"
[@student]: <https://github.com/student> "Nathan Zook's GitHub"
[@tmatilai]: <https://github.com/tmatilai> "Teemu Matilainen's GitHub"
