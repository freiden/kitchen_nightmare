# Change log

## master (unreleased)

## 0.23.0 (02/06/2014)

### New features

* [#1117](https://github.com/bbatsov/rubocop/issues/1117): `BlockComments` cop does auto-correction. ([@jonas054][])
* [#1124](https://github.com/bbatsov/rubocop/pull/1124): `TrivialAccessors` cop auto-corrects class-level accessors. ([@ggilder][])
* [#1062](https://github.com/bbatsov/rubocop/pull/1062): New cop `InlineComment` checks for inline comments. ([@salbertson][])
* [#1118](https://github.com/bbatsov/rubocop/issues/1118): Add checking and auto-correction of right brackets in `IndentArray` and `IndentHash`. ([@jonas054][])

### Changes

* [#1097](https://github.com/bbatsov/rubocop/issues/1097): Add optional namespace prefix to cop names: `Style/LineLength` instead of `LineLength` in config files, `--only` argument, `--show-cops` output, and `# rubocop:disable`. ([@jonas054][])
* [#1075](https://github.com/bbatsov/rubocop/issues/1075): More strict limits on when to require trailing comma. ([@jonas054][])
* Renamed `Rubocop` module to `RuboCop`. ([@bbatsov][])

### Bugs fixed

* [#1126](https://github.com/bbatsov/rubocop/pull/1126): Fix `--auto-gen-config` bug with `RegexpLiteral` where only the last file's results would be used. ([@ggilder][])
* [#1104](https://github.com/bbatsov/rubocop/issues/1104): Fix `EachWithObject` with modifier if as body. ([@geniou][])
* [#1106](https://github.com/bbatsov/rubocop/issues/1106): Fix `EachWithObject` with single method call as body. ([@geniou][])
* Avoid the warning about ignoring syck YAML engine from JRuby. ([@jonas054][])
* [#1111](https://github.com/bbatsov/rubocop/issues/1111): Fix problem in `EndOfLine` with reading non-UTF-8 encoded files. ([@jonas054][])
* [#1115](https://github.com/bbatsov/rubocop/issues/1115): Fix `Next` to ignore super nodes. ([@geniou][])
* [#1117](https://github.com/bbatsov/rubocop/issues/1117): Don't auto-correct indentation in scopes that contain block comments (`=begin`..`=end`). ([@jonas054][])
* [#1123](https://github.com/bbatsov/rubocop/pull/1123): Support setter calls in safe assignment in `ParenthesesAroundCondition`. ([@jonas054][])
* [#1090](https://github.com/bbatsov/rubocop/issues/1090): Correct handling of documentation vs annotation comment. ([@jonas054][])
* [#1118](https://github.com/bbatsov/rubocop/issues/1118): Never write invalid ruby to a file in auto-correct. ([@jonas054][])
* [#1120](https://github.com/bbatsov/rubocop/issues/1120): Don't change indentation of heredoc strings in auto-correct. ([@jonas054][])
* [#1109](https://github.com/bbatsov/rubocop/issues/1109): Handle conditions with modifier ops in them in `ParenthesesAroundCondition`. ([@bbatsov][])

## 0.22.0 (20/04/2014)

### New features

* [#974](https://github.com/bbatsov/rubocop/pull/974): New cop `CommentIndentation` checks indentation of comments. ([@jonas054][])
* Add new cop `EachWithObject` to prefer `each_with_object` over `inject` or `reduce`. ([@geniou][])
* [#1010](https://github.com/bbatsov/rubocop/issues/1010): New Cop `Next` check for conditions at the end of an interation and propose to use `next` instead. ([@geniou][])
* The `GuardClause` cop now also looks for unless and it is configurable how many lines the body of an if / unless needs to have to not be ignored. ([@geniou][])
* [#835](https://github.com/bbatsov/rubocop/issues/835): New cop `UnneededPercentX` checks for `%x` when backquotes would do. ([@jonas054][])
* Add auto-correct to `UnusedBlockArgument` and `UnusedMethodArgument` cops. ([@hannestyden][])
* [#1074](https://github.com/bbatsov/rubocop/issues/1074): New cop `SpaceBeforeComment` checks for missing space between code and a comment on the same line. ([@jonas054][])
* [#1089](https://github.com/bbatsov/rubocop/pull/1089): New option `-F`/`--fail-fast` inspects files in modification time order and stop after the first file with offenses. ([@jonas054][])
* Add optional `require` directive to `.rubocop.yml` to load custom ruby files. ([@geniou][])

### Changes

* `NonNilCheck` offense reporting and autocorrect are configurable to include semantic changes. ([@hannestyden][])
* The parameters `AllCops/Excludes` and `AllCops/Includes` with final `s` only give a warning and don't halt `rubocop` execution. ([@jonas054][])
* The `GuardClause` cop is no longer irgnoring a one-line body by default - see configuration. ([@geniou][])
* [#1050](https://github.com/bbatsov/rubocop/issues/1050): Rename `rubocop-todo.yml` file to `.rubocop_todo.yml`. ([@geniou][])
* [#1064](https://github.com/bbatsov/rubocop/issues/1064): Adjust default max line length to 80. ([@bbatsov][])

### Bugs fixed

* Allow assignment in `AlignParameters` cop. ([@tommeier][])
* Fix `Void` and `SpaceAroundOperators` for short call syntax `lambda.()`. ([@biinari][])
* Fix `Delegate` for delegation with assignment or constant. ([@geniou][])
* [#1032](https://github.com/bbatsov/rubocop/issues/1032): Avoid duplicate reporting when code moves around due to `--auto-correct`. ([@jonas054][])
* [#1036](https://github.com/bbatsov/rubocop/issues/1036): Handle strings like `__FILE__` in `LineEndConcatenation`. ([@bbatsov][])
* [#1006](https://github.com/bbatsov/rubocop/issues/1006): Fix LineEndConcatenation to handle chained concatenations. ([@barunio][])
* [#1066](https://github.com/bbatsov/rubocop/issues/1066): Fix auto-correct for `NegatedIf` when the condition has parentheses around it. ([@jonas054][])
* Fix `AlignParameters` `with_fixed_indentation` for multi-line method calls. ([@molawson][])
* Fix problem that appears in some installations when reading empty YAML files. ([@jonas054][])
* [#1022](https://github.com/bbatsov/rubocop/issues/1022): A Cop will no longer auto-correct a file that's excluded through an `Exclude` setting in the cop's configuration. ([@jonas054][])
* Fix paths in `Exclude` config section not being recognized on Windows. ([@wndhydrnt][])
* [#1094](https://github.com/bbatsov/rubocop/issues/1094): Fix ClassAndModuleChildren for classes with a single method. ([@geniou][])

## 0.21.0 (24/04/2014)

### New features

* [#835](https://github.com/bbatsov/rubocop/issues/835): New cop `UnneededCapitalW` checks for `%W` when interpolation not necessary and `%w` would do. ([@sfeldon][])
* [#934](https://github.com/bbatsov/rubocop/issues/934): New cop `UnderscorePrefixedVariableName` checks for `_`-prefixed variables that are actually used. ([@yujinakayama][])
* [#934](https://github.com/bbatsov/rubocop/issues/934): New cop `UnusedMethodArgument` checks for unused method arguments. ([@yujinakayama][])
* [#934](https://github.com/bbatsov/rubocop/issues/934): New cop `UnusedBlockArgument` checks for unused block arguments. ([@yujinakayama][])
* [#964](https://github.com/bbatsov/rubocop/issues/964): `RedundantBegin` cop does auto-correction. ([@tamird][])
* [#966](https://github.com/bbatsov/rubocop/issues/966): `RescueException` cop does auto-correction. ([@tamird][])
* [#967](https://github.com/bbatsov/rubocop/issues/967): `TrivialAccessors` cop does auto-correction. ([@tamird][])
* [#963](https://github.com/bbatsov/rubocop/issues/963): Add `AllowDSLWriters` options to `TrivialAccessors`. ([@tamird][])
* [#969](https://github.com/bbatsov/rubocop/issues/969): Let the `Debugger` cop check for forgotten calls to byebug. ([@bquorning][])
* [#971](https://github.com/bbatsov/rubocop/issues/971): Configuration format deprecation warnings include the path to the problematic config file. ([@bcobb][])
* [#490](https://github.com/bbatsov/rubocop/issues/490): Add EnforcedStyle config option to TrailingBlankLines. ([@jonas054][])
* Add `auto_correct` task to Rake integration. ([@irrationalfab][])
* [#986](https://github.com/bbatsov/rubocop/issues/986): The `--only` option can take a comma-separated list of cops. ([@jonas054][])
* New Rails cop `Delegate` that checks for delegations that could be replaced by the `delegate` method. ([@geniou][])
* Add configuration to `Encoding` cop to only enforce encoding comment if there are non ASCII characters. ([@geniou][])

### Changes

* Removed `FinalNewline` cop as its check is now performed by `TrailingBlankLines`. ([@jonas054][])
* [#1011](https://github.com/bbatsov/rubocop/issues/1011): Pattern matching with `Dir#[]` for config parameters added. ([@jonas054][])

### Bugs fixed

* Update description on `LineEndConcatenation` cop. ([@mockdeep][])
* [#978](https://github.com/bbatsov/rubocop/issues/978): Fix regression in `IndentationWidth` handling method calls. ([@tamird][])
* [#976](https://github.com/bbatsov/rubocop/issues/976): Fix `EndAlignment` not handling element assignment correctly. ([@tamird][])
* [#976](https://github.com/bbatsov/rubocop/issues/976): Fix `IndentationWidth` not handling element assignment correctly. ([@tamird][])
* [#800](https://github.com/bbatsov/rubocop/issues/800): Do not report `[Corrected]` in `--auto-correct` mode if correction wasn't done. ([@jonas054][])
* [#968](https://github.com/bbatsov/rubocop/issues/968): Fix bug when running RuboCop with `-c .rubocop.yml`. ([@bquorning][])
* [#975](https://github.com/bbatsov/rubocop/pull/975): Fix infinite correction in `IndentationWidth`. ([@jonas054][])
* [#986](https://github.com/bbatsov/rubocop/issues/986): When `--lint` is used together with `--only`, all lint cops are run in addition to the given cops. ([@jonas054][])
* [#997](https://github.com/bbatsov/rubocop/issues/997): Fix handling of file paths for matching against `Exclude` property when `rubocop .` is called. ([@jonas054][])
* [#1000](https://github.com/bbatsov/rubocop/issues/1000): Support modifier (e.g., `private`) and `def` on the same line (Ruby >= 2.1) in `IndentationWidth`. ([@jonas054][])
* [#1001](https://github.com/bbatsov/rubocop/issues/1001): Fix `--auto-gen-config` logic for `RegexpLiteral`. ([@jonas054][])
* [#993](https://github.com/bbatsov/rubocop/issues/993): Do not report any offenses for the contents of an empty file. ([@jonas054][])
* [#1016](https://github.com/bbatsov/rubocop/issues/1016): Fix a false positive in `ConditionPosition` regarding statement modifiers. ([@bbatsov][])
* [#1014](https://github.com/bbatsov/rubocop/issues/1014): Fix handling of strings nested in `dstr` nodes. ([@bbatsov][])

## 0.20.1 (05/04/2014)

### Bugs fixed

* [#940](https://github.com/bbatsov/rubocop/issues/940): Fixed `UselessAccessModifier` not handling `attr_*` correctly. ([@fshowalter][])
* `NegatedIf` properly handles negated `unless` condition. ([@bbatsov][])
* `NegatedWhile` properly handles negated `until` condition. ([@bbatsov][])
* [#925](https://github.com/bbatsov/rubocop/issues/925): Do not disable the `Syntax` cop in output from `--auto-gen-config`. ([@jonas054][])
* [#943](https://github.com/bbatsov/rubocop/issues/943): Fix auto-correction interference problem between `SpaceAfterComma` and other cops. ([@jonas054][])
* [#954](https://github.com/bbatsov/rubocop/pull/954): Fix auto-correction bug in `NilComparison`. ([@bbatsov][])
* [#953](https://github.com/bbatsov/rubocop/pull/953): Fix auto-correction bug in `NonNilCheck`. ([@bbatsov][])
* [#952](https://github.com/bbatsov/rubocop/pull/952): Handle implicit receiver in `StringConversionInInterpolation`. ([@bbatsov][])
* [#956](https://github.com/bbatsov/rubocop/pull/956): Apply `ClassMethods` check only on `class`/`module` bodies. ([@bbatsov][])
* [#945](https://github.com/bbatsov/rubocop/issues/945): Fix SpaceBeforeFirstArg cop for multiline argument and exclude assignments. ([@cschramm][])
* [#948](https://github.com/bbatsov/rubocop/issues/948): `Blocks` cop avoids auto-correction if it would introduce a semantic change. ([@jonas054][])
* [#946](https://github.com/bbatsov/rubocop/issues/946): Allow non-nil checks that are the final expressions of predicate method definitions in `NonNilCheck`. ([@bbatsov][])
* [#957](https://github.com/bbatsov/rubocop/issues/957): Allow space + comment inside parentheses, braces, and square brackets. ([@jonas054][])

## 0.20.0 (02/04/2014)

### New features

* New cop `GuardClause` checks for conditionals that can be replaced by guard clauses. ([@bbatsov][])
* New cop `EmptyInterpolation` checks for empty interpolation in double-quoted strings. ([@bbatsov][])
* [#899](https://github.com/bbatsov/rubocop/issues/899): Make `LineEndConcatenation` cop `<<` aware. ([@mockdeep][])
* [#896](https://github.com/bbatsov/rubocop/issues/896): New option `--fail-level` changes minimum severity for exit with error code. ([@hiroponz][])
* [#893](https://github.com/bbatsov/rubocop/issues/893): New option `--force-exclusion` forces excluding files specified in the configuration `Exclude` even if they are explicitly passed as arguments. ([@yujinakayama][])
* `VariableInterpolation` cop does auto-correction. ([@bbatsov][])
* `Not` cop does auto-correction. ([@bbatsov][])
* `ClassMethods` cop does auto-correction. ([@bbatsov][])
* `StringConversionInInterpolation` cop does auto-correction. ([@bbatsov][])
* `NilComparison` cop does auto-correction. ([@bbatsov][])
* `NonNilComparison` cop does auto-correction. ([@bbatsov][])
* `NegatedIf` cop does auto-correction. ([@bbatsov][])
* `NegatedWhile` cop does auto-correction. ([@bbatsov][])
* New lint cop `SpaceBeforeFirstArg` checks for space between the method name and the first argument in method calls without parentheses. ([@jonas054][])
* New style cop `SingleSpaceBeforeFirstArg` checks that no more than one space is used between the method name and the first argument in method calls without parentheses. ([@jonas054][])
* New formatter `disabled_lines` displays cops and line ranges disabled by inline comments. ([@fshowalter][])
* New cop `UselessAccessModifiers` checks for access modifiers that have no effect. ([@fshowalter][])

### Changes

* [#913](https://github.com/bbatsov/rubocop/issues/913): `FileName` accepts multiple extensions. ([@tamird][])
* `AllCops/Excludes` and `AllCops/Includes` were renamed to `AllCops/Exclude` and `AllCops/Include` for consistency with standard cop params. ([@bbatsov][])
* Extract `NonNilCheck` cop from `NilComparison`. ([@bbatsov][])
* Renamed `FavorJoin` to `ArrayJoin`. ([@bbatsov][])
* Renamed `FavorUnlessOverNegatedIf` to `NegatedIf`. ([@bbatsov][])
* Renamed `FavorUntilOverNegatedWhile`to `NegatedWhile`. ([@bbatsov][])
* Renamed `HashMethods` to `DeprecatedHashMethods`. ([@bbatsov][])
* Renamed `ReadAttribute` to `ReadWriteAttribute` and extended it to check for uses of `write_attribute`. ([@bbatsov][])
* Add experimental support for Ruby 2.2 (development version) by falling back to Ruby 2.1 parser. ([@yujinakayama][])

### Bugs fixed

* [#926](https://github.com/bbatsov/rubocop/issues/926): Fixed `BlockNesting` not auto-generating correctly. ([@tmorris-fiksu][])
* [#904](https://github.com/bbatsov/rubocop/issues/904): Fixed a NPE in `LiteralInInterpolation`. ([@bbatsov][])
* [#904](https://github.com/bbatsov/rubocop/issues/904): Fixed a NPE in `StringConversionInInterpolation`. ([@bbatsov][])
* [#892](https://github.com/bbatsov/rubocop/issues/892): Make sure `Include` and `Exclude` paths in a `.rubocop.yml` are interpreted as relative to the directory of that file. ([@jonas054][])
* [#906](https://github.com/bbatsov/rubocop/issues/906): Fixed a false positive in `LiteralInInterpolation`. ([@bbatsov][])
* [#909](https://github.com/bbatsov/rubocop/issues/909): Handle properly multiple `rescue` clauses in `SignalException`. ([@bbatsov][])
* [#876](https://github.com/bbatsov/rubocop/issues/876): Do a deep merge of hashes when overriding default configuration in a `.rubocop.yml` file. ([@jonas054][])
* [#912](https://github.com/bbatsov/rubocop/issues/912): Fix a false positive in `LineEndConcatenation` for `%` string literals. ([@bbatsov][])
* [#912](https://github.com/bbatsov/rubocop/issues/912): Handle top-level constant resolution in `DeprecatedClassMethods` (e.g. `::File.exists?`). ([@bbatsov][])
* [#914](https://github.com/bbatsov/rubocop/issues/914): Fixed rdoc error during gem installation. ([@bbatsov][])
* The `--only` option now enables the given cop in case it is disabled in configuration. ([@jonas054][])
* Fix path resolution so that the default exclusion of `vendor` directories works. ([@jonas054][])
* [#908](https://github.com/bbatsov/rubocop/issues/908): Fixed hanging while auto correct for `SpaceAfterComma` and `SpaceInsideBrackets`. ([@hiroponz][])
* [#919](https://github.com/bbatsov/rubocop/issues/919): Don't avoid auto-correction in `HashSyntax` when there is missing space around operator. ([@jonas054][])
* Fixed handling of floats in `NumericLiterals`. ([@bbatsov][])
* [#927](https://github.com/bbatsov/rubocop/issues/927): Let `--auto-gen-config` overwrite an existing `rubocop-todo.yml` file instead of asking the user to remove it. ([@jonas054][])
* [#936](https://github.com/bbatsov/rubocop/issues/936): Allow `_other` as well as `other` in `OpMethod`. ([@bbatsov][])

## 0.19.1 (17/03/2014)

### Bugs fixed

* [#884](https://github.com/bbatsov/rubocop/issues/884): Fix --auto-gen-config for `NumericLiterals` so MinDigits is correct. ([@tmorris-fiksu][])
* [#879](https://github.com/bbatsov/rubocop/issues/879): Fix --auto-gen-config for `RegexpLiteral` so we don't generate illegal values for `MaxSlashes`. ([@jonas054][])
* Fix the name of the `Include` param in the default config of the Rails cops. ([@bbatsov][])
* [#878](https://github.com/bbatsov/rubocop/pull/878): Blacklist `Rakefile`, `Gemfile` and `Capfile` by default in the `FileName` cop. ([@bbatsov][])
* [#875](https://github.com/bbatsov/rubocop/issues/875): Handle `separator` style hashes in `IndentHash`. ([@jonas054][])
* Fix a bug where multiple cli options that result in exit can be specified at once (e.g. `-vV`, `-v --show-cops`). ([@jkogara][])
* [#889](https://github.com/bbatsov/rubocop/issues/889): Fix a false positive for `LiteralInCondition` when the condition is non-primitive array. ([@bbatsov][])

## 0.19.0 (13/03/2014)

### New features

* New cop `FileName` makes sure that source files have snake_case names. ([@bbatsov][])
* New cop `DeprecatedClassMethods` checks for deprecated class methods. ([@bbatsov][])
* New cop `StringConversionInInterpolation` checks for redundant `Object#to_s` in string interpolation. ([@bbatsov][])
* New cop `LiteralInInterpolation` checks for interpolated string literals. ([@bbatsov][])
* New cop `SelfAssignment` checks for places where the self-assignment shorthand should have been used. ([@bbatsov][])
* New cop `DoubleNegation` checks for uses of `!!`. ([@bbatsov][])
* New cop `PercentLiteralDelimiters` enforces consistent usage of `%`-literal delimiters. ([@hannestyden][])
* New Rails cop `ActionFilter` enforces the use of `_filter` or `_action` action filter methods. ([@bbatsov][])
* New Rails cop `ScopeArgs` makes sure you invoke the `scope` method properly. ([@bbatsov][])
* Add `with_fixed_indentation` style to `AlignParameters` cop. ([@hannestyden][])
* Add `IgnoreLastArgumentHash` option to `AlignHash` cop. ([@hannestyden][])
* [#743](https://github.com/bbatsov/rubocop/issues/743): `SingleLineMethods` cop does auto-correction. ([@jonas054][])
* [#743](https://github.com/bbatsov/rubocop/issues/743): `Semicolon` cop does auto-correction. ([@jonas054][])
* [#743](https://github.com/bbatsov/rubocop/issues/743): `EmptyLineBetweenDefs` cop does auto-correction. ([@jonas054][])
* [#743](https://github.com/bbatsov/rubocop/issues/743): `IndentationWidth` cop does auto-correction. ([@jonas054][])
* [#743](https://github.com/bbatsov/rubocop/issues/743): `IndentationConsistency` cop does auto-correction. ([@jonas054][])
* [#809](https://github.com/bbatsov/rubocop/issues/809): New formatter `fuubar` displays a progress bar and shows details of offenses as soon as they are detected. ([@yujinakayama][])
* [#797](https://github.com/bbatsov/rubocop/issues/797): New cop `IndentHash` checks the indentation of the first key in multi-line hash literals. ([@jonas054][])
* [#797](https://github.com/bbatsov/rubocop/issues/797): New cop `IndentArray` checks the indentation of the first element in multi-line array literals. ([@jonas054][])
* [#806](https://github.com/bbatsov/rubocop/issues/806): Now excludes files in `vendor/**` by default. ([@jeremyolliver][])
* [#795](https://github.com/bbatsov/rubocop/issues/795): `IfUnlessModifier` and `WhileUntilModifier` supports `MaxLineLength`, which is independent of `LineLength` parameter `Max`. ([@agrimm][])
* [#868](https://github.com/bbatsov/rubocop/issues/868): New cop `ClassAndModuleChildren` checks the style of children definitions at classes and modules: nested / compact. ([@geniou][])

### Changes

* [#793](https://github.com/bbatsov/rubocop/issues/793): Add printing total count when `rubocop --format offences`. ([@ma2gedev][])
* Remove `Ignore` param from the Rails `Output` cop. The standard `Exclude/Include` should be used instead. ([@bbatsov][])
* Renamed `FavorSprintf` to `FormatString` and made it configurable. ([@bbatsov][])
* Renamed `Offence` to `Offense`. ([@bbatsov][])
* Use `offense` in all messages instead of `offence`. ([@bbatsov][])
* For indentation of `if`/`unless`/`while`/`until` bodies when the result is assigned to a variable, instead of supporting two styles simultaneously, `IndentationWidth` now supports one style of indentation at a time, specified by `EndAlignment`/`AlignWith`. ([@jonas054][])
* Renamed `Style` param of `DotPosition` cop to `EnforcedStyle`. ([@bbatsov][])
* Add `length` value to locations of offense in JSON formatter. ([@yujinakayama][])
* `SpaceAroundBlockBraces` cop replaced by `SpaceBeforeBlockBraces` and `SpaceInsideBlockBraces`. ([@jonas054][])
* `SpaceAroundEqualsInParameterDefault` cop is now configurable with the `EnforcedStyle` option. ([@jonas054][])

### Bugs fixed

* [#790](https://github.com/bbatsov/rubocop/issues/790): Fix auto-correction interference problem between `MethodDefParentheses` and other cops. ([@jonas054][])
* [#794](https://github.com/bbatsov/rubocop/issues/794): Fix handling of modifier keywords with required parentheses in `ParenthesesAroundCondition`. ([@bbatsov][])
* [#804](https://github.com/bbatsov/rubocop/issues/804): Fix a false positive with operator assignments in a loop (including `begin..rescue..end` with `retry`) in `UselessAssignment`. ([@yujinakayama][])
* [#815](https://github.com/bbatsov/rubocop/issues/815): Fix a false positive for heredocs with blank lines in them in `EmptyLines`. ([@bbatsov][])
* Auto-correction is now more robust and less likely to die because of `RangeError` or "clobbering". ([@jonas054][])
* Offenses always reported in order of position in file, also during `--auto-correct` runs. ([@jonas054][])
* Fix problem with `[Corrected]` tag sometimes missing in output from `--auto-correct` runs. ([@jonas054][])
* Fix message from `EndAlignment` cop when `AlignWith` is `keyword`. ([@jonas054][])
* Handle `case` conditions in `LiteralInCondition`. ([@bbatsov][])
* [#822](https://github.com/bbatsov/rubocop/issues/822): Fix a false positive in `DotPosition` when enforced style is set to `trailing`. ([@bbatsov][])
* Handle properly dynamic strings in `LineEndConcatenation`. ([@bbatsov][])
* [#832](https://github.com/bbatsov/rubocop/issues/832): Fix auto-correction interference problem between `BracesAroundHashParameters` and `SpaceInsideHashLiteralBraces`. ([@jonas054][])
* Fix bug in auto-correction of alignment so that only space can be removed. ([@jonas054][])
* Fix bug in `IndentationWidth` auto-correction so it doesn't correct things that `IndentationConsistency` should correct. ([@jonas054][])
* [#847](https://github.com/bbatsov/rubocop/issues/847): Fix bug in `RegexpLiteral` concerning `--auto-gen-config`. ([@jonas054][])
* [#848](https://github.com/bbatsov/rubocop/issues/848): Fix bug in `--show-cops` that made it print the default configuration rather than the current configuration. ([@jonas054][])
* [#862](https://github.com/bbatsov/rubocop/issues/862): Fix a bug where single line `rubocop:disable` comments with indentations were treated as multiline cop disabling comments. ([@yujinakayama][])
* Fix a bug where `rubocop:disable` comments with a cop name including `all` (e.g. `MethodCallParentheses`) were disabling all cops. ([@yujinakayama][])
* Fix a bug where string and regexp literals including `# rubocop:disable` were confused with real comments. ([@yujinakayama][])
* [#877](https://github.com/bbatsov/rubocop/issues/877): Fix bug in `PercentLiteralDelimiters` concerning auto-correct of regular expressions with interpolation. ([@hannestyden][])

## 0.18.1 (02/02/2014)

### Bugs fixed

* Remove double reporting in `EmptyLinesAroundBody` of empty line inside otherwise empty class/module/method that caused crash in autocorrect. ([@jonas054][])
* [#779](https://github.com/bbatsov/rubocop/issues/779): Fix a false positive in `LineEndConcatenation`. ([@bbatsov][])
* [#751](https://github.com/bbatsov/rubocop/issues/751): Fix `Documentation` cop so that a comment followed by an empty line and then a class definition is not considered to be class documentation. ([@jonas054][])
* [#783](https://github.com/bbatsov/rubocop/issues/783): Fix a false positive in `ParenthesesAroundCondition` when the parentheses are actually required. ([@bbatsov][])
* [#781](https://github.com/bbatsov/rubocop/issues/781): Fix problem with back-and-forth auto-correction in `AccessModifierIndentation`. ([@jonas054][])
* [#785](https://github.com/bbatsov/rubocop/issues/785): Fix false positive on `%w` arrays in `TrailingComma`. ([@jonas054][])
* [#782](https://github.com/bbatsov/rubocop/issues/782): Fix false positive in `AlignHash` for single line hashes. ([@jonas054][])

## 0.18.0 (30/01/2014)

### New features

* [#714](https://github.com/bbatsov/rubocop/issues/714): New cop `RequireParentheses` checks for method calls without parentheses together with a boolean operator indicating that a mistake about precedence may have been made. ([@jonas054][])
* [#743](https://github.com/bbatsov/rubocop/issues/743): `WordArray` cop does auto-correction. ([@jonas054][])
* [#743](https://github.com/bbatsov/rubocop/issues/743): `Proc` cop does auto-correction. ([@bbatsov][])
* [#743](https://github.com/bbatsov/rubocop/issues/743): `AccessModifierIndentation` cop does auto-correction. ([@jonas054][])
* [#768](https://github.com/bbatsov/rubocop/issues/768): Rake task now supports `requires` and `options`. ([@nevir][])
* [#759](https://github.com/bbatsov/rubocop/issues/759): New cop `EndLineConcatenation` checks for string literal concatenation with `+` at line end. ([@bbatsov][])

### Changes

* [#762](https://github.com/bbatsov/rubocop/issues/762): Support Rainbow gem both 1.99.x and 2.x. ([@yujinakayama][])
* [#761](https://github.com/bbatsov/rubocop/issues/761): Relax `json` requirement to `>= 1.7.7`. ([@bbatsov][])
* [#757](https://github.com/bbatsov/rubocop/issues/757): `Include/Exclude` supports relative globbing to some extent. ([@nevir][])

### Bugs fixed

* [#764](https://github.com/bbatsov/rubocop/issues/764): Handle heredocs in `TrailingComma`. ([@jonas054][])
* Guide for contributors now points to correct issues page. ([@scottmatthewman][])

## 0.17.0 (25/01/2014)

### New features

* New cop `ConditionPosition` checks for misplaced conditions in expressions like `if/unless/when/until`. ([@bbatsov][])
* New cop `ElseLayout` checks for odd arrangement of code in the `else` branch of a conditional expression. ([@bbatsov][])
* [#694](https://github.com/bbatsov/rubocop/issues/694): Support Ruby 1.9.2 until June 2014. ([@yujinakayama][])
* [#702](https://github.com/bbatsov/rubocop/issues/702): Improve `rubocop-todo.yml` with comments about offence count, configuration parameters, and auto-correction support. ([@jonas054][])
* Add new command-line flag `-D/--display-cop-names` to trigger the display of cop names in offence messages. ([@bbatsov][])
* [#733](https://github.com/bbatsov/rubocop/pull/733): `NumericLiterals` cop does auto-correction. ([@dblock][])
* [#713](https://github.com/bbatsov/rubocop/issues/713): New cop `TrailingComma` checks for comma after the last item in a hash, array, or method call parameter list. ([@jonas054][])

### Changes

* [#581](https://github.com/bbatsov/rubocop/pull/581): Extracted a new cop `AmbiguousOperator` from `Syntax` cop. It checks for ambiguous operators in the first argument of a method invocation without parentheses. ([@yujinakayama][])
* Extracted a new cop `AmbiguousRegexpLiteral` from `Syntax` cop. It checks for ambiguous regexp literals in the first argument of a method invocation without parentheses. ([@yujinakayama][])
* Extracted a new cop `UselessElseWithoutRescue` from `Syntax` cop. It checks for useless `else` in `begin..end` without `rescue`. ([@yujinakayama][])
* Extracted a new cop `InvalidCharacterLiteral` from `Syntax` cop. It checks for invalid character literals with a non-escaped whitespace character (e.g. `? `). ([@yujinakayama][])
* Removed `Syntax` cop from the configuration. It no longer can be disabled and it reports only invalid syntax offences. ([@yujinakayama][])
* [#688](https://github.com/bbatsov/rubocop/issues/688): Output from `rubocop --show-cops` now looks like a YAML configuration file. The `--show-cops` option takes a comma separated list of cops as optional argument. ([@jonas054][])
* New cop `IndentationConsistency` extracted from `IndentationWidth`, which has checked two kinds of offences until now. ([@jonas054][])

### Bugs fixed

* [#698](https://github.com/bbatsov/rubocop/pull/698): Support Windows paths on command-line. ([@rifraf][])
* [#498](https://github.com/bbatsov/rubocop/issues/498): Disable terminal ANSI escape sequences when a formatter's output is not a TTY. ([@yujinakayama][])
* [#703](https://github.com/bbatsov/rubocop/issues/703): BracesAroundHashParameters auto-correction broken with trailing comma. ([@jonas054][])
* [#709](https://github.com/bbatsov/rubocop/issues/709): When `EndAlignment` has configuration `AlignWith: variable`, it now handles `@@a = if ...` and `a, b = if ...`. ([@jonas054][])
* `SpaceAroundOperators` now reports an offence for `@@a=0`. ([@jonas054][])
* [#707](https://github.com/bbatsov/rubocop/issues/707): Fix error on operator assignments in top level scope in `UselessAssignment`. ([@yujinakayama][])
* Fix a bug where some offences were discarded when any cop that has specific target file path (by `Include` or `Exclude` under each cop configuration) had run. ([@yujinakayama][])
* [#724](https://github.com/bbatsov/rubocop/issues/724): Accept colons denoting required keyword argument (a new feature in Ruby 2.1) without trailing space in `SpaceAfterColon`. ([@jonas054][])
* The `--no-color` option works again. ([@jonas054][])
* [#716](https://github.com/bbatsov/rubocop/issues/716): Fixed a regression in the auto-correction logic of `MethodDefParentheses`. ([@bbatsov][])
* Inspected projects that lack a `.rubocop.yml` file, and therefore get their configuration from RuboCop's `config/default.yml`, no longer get configuration from RuboCop's `.rubocop.yml` and `rubocop-todo.yml`. ([@jonas054][])
* [#730](https://github.com/bbatsov/rubocop/issues/730): `EndAlignment` now handles for example `private def some_method`, which is allowed in Ruby 2.1. It requires `end` to be aligned with `private`, not `def`, in such cases. ([@jonas054][])
* [#744](https://github.com/bbatsov/rubocop/issues/744): Any new offences created by `--auto-correct` are now handled immediately and corrected when possible, so running `--auto-correct` once is enough. ([@jonas054][])
* [#748](https://github.com/bbatsov/rubocop/pull/748): Auto-correction conflict between `EmptyLinesAroundBody` and `TrailingWhitespace` resolved. ([@jonas054][])
* `ParenthesesAroundCondition` no longer crashes on parentheses around the condition in a ternary if. ([@jonas054][])
* [#738](https://github.com/bbatsov/rubocop/issues/738): Fix a false positive in `StringLiterals`. ([@bbatsov][])

## 0.16.0 (25/12/2013)

### New features

* [#612](https://github.com/bbatsov/rubocop/pull/612): `BracesAroundHashParameters` cop does auto-correction. ([@dblock][])
* [#614](https://github.com/bbatsov/rubocop/pull/614): `ParenthesesAroundCondition` cop does auto-correction. ([@dblock][])
* [#624](https://github.com/bbatsov/rubocop/pull/624): `EmptyLines` cop does auto-correction. ([@dblock][])
* New Rails cop `DefaultScope` ensures `default_scope` is called properly with a block argument. ([@bbatsov][])
* All cops now support the `Include` param, which specifies the files on which they should operate. ([@bbatsov][])
* All cops now support the `Exclude` param, which specifies the files on which they should not operate. ([@bbatsov][])
* [#631](https://github.com/bbatsov/rubocop/issues/631): `IndentationWidth` cop now detects inconsistent indentation between lines that should have the same indentation. ([@jonas054][])
* [#649](https://github.com/bbatsov/rubocop/pull/649): `EmptyLinesAroundBody` cop does auto-correction. ([@dblock][])
* [#657](https://github.com/bbatsov/rubocop/pull/657): `Alias` cop does auto-correction. ([@dblock][])
* Rake task now support setting formatters. ([@pmenglund][])
* [#653](https://github.com/bbatsov/rubocop/issues/653): `CaseIndentation` cop is now configurable with parameters `IndentWhenRelativeTo` and `IndentOneStep`. ([@jonas054][])
* [#654](https://github.com/bbatsov/rubocop/pull/654): `For` cop is now configurable to enforce either `each` (default) or `for`. ([@jonas054][])
* [#661](https://github.com/bbatsov/rubocop/issues/661): `EndAlignment` cop is now configurable for alignment with `keyword` (default) or `variable`. ([@jonas054][])
* Allow to overwrite the severity of a cop with the new `Severity` param. ([@codez][])
* New cop `FlipFlop` checks for flip flops. ([@agrimm][])
* [#577](https://github.com/bbatsov/rubocop/issues/577): Introduced `MethodDefParentheses` to allow for for requiring either parentheses or no parentheses in method definitions. Replaces `DefWithoutParentheses`. ([@skanev][])
* [#693](https://github.com/bbatsov/rubocop/pull/693): Generation of parameter values (i.e., not only `Enabled: false`) in `rubocop-todo.yml` by the `--auto-gen-config` option is now supported for some cops. ([@jonas054][])
* New cop `AccessorMethodName` checks accessor method names for non-idiomatic names like `get_attribute` and `set_attribute`. ([@bbatsov][])
* New cop `PredicateName` checks the names of predicate methods for non-idiomatic names like `is_something`, `has_something`, etc. ([@bbatsov][])
* Support Ruby 2.1 with Parser 2.1. ([@yujinakayama][])

### Changes

* Removed `SymbolNames` as it was generating way too many false positives. ([@bbatsov][])
* Renamed `ReduceArguments` to `SingleLineBlockParams` and made it configurable. ([@bbatsov][])

### Bugs fixed

* Handle properly heredocs in `StringLiterals` cop. ([@bbatsov][])
* Fix `SpaceAroundOperators` to not report missing space around operator for `def self.method *args`. ([@jonas054][])
* Properly handle `['AllCops']['Includes']` and `['AllCops']['Excludes']` when passing config via `-c`. ([@fancyremarker][], [@codez][])
* [#611](https://github.com/bbatsov/rubocop/pull/611): Fix crash when loading an empty config file. ([@sinisterchipmunk][])
* Fix `DotPosition` cop with `trailing` style for method calls on same line. ([@vonTronje][])
* [#627](https://github.com/bbatsov/rubocop/pull/627): Fix counting of slashes in complicated regexps in `RegexpLiteral` cop. ([@jonas054][])
* [#638](https://github.com/bbatsov/rubocop/issues/638): Fix bug in auto-correct that changes `each{ |x|` to `each d o |x|`. ([@jonas054][])
* [#418](https://github.com/bbatsov/rubocop/issues/418): Stop searching for configuration files above the work directory of the isolated environment when running specs. ([@jonas054][])
* Fix error on implicit match conditionals (e.g. `if /pattern/; end`) in `MultilineIfThen`. ([@agrimm][])
* [#651](https://github.com/bbatsov/rubocop/issues/651): Handle properly method arguments in `RedundantSelf`. ([@bbatsov][])
* [#628](https://github.com/bbatsov/rubocop/issues/628): Allow `self.Foo` in `RedundantSelf` cop. ([@chulkilee][])
* [#668](https://github.com/bbatsov/rubocop/issues/668): Fix crash in `EndOfLine` that occurs when default encoding is `US_ASCII` and an inspected file has non-ascii characters. ([@jonas054][])
* [#664](https://github.com/bbatsov/rubocop/issues/664): Accept oneline while when condition has local variable assignment. ([@emou][])
* Fix auto-correct for `MethodDefParentheses` when parentheses are required. ([@skanev][])

## 0.15.0 (06/11/2013)

### New features

* New cop `Output` checks for calls to print, puts, etc. in Rails. ([@daviddavis][])
* New cop `EmptyLinesAroundBody` checks for empty lines around the bodies of class, method and module definitions. ([@bbatsov][])
* `LeadingCommentSpace` cop does auto-correction. ([@jonas054][])
* `SpaceAfterControlKeyword` cop does auto-correction. ([@jonas054][])
* `SpaceAfterColon` cop does auto-correction. ([@jonas054][])
* `SpaceAfterComma` cop does auto-correction. ([@jonas054][])
* `SpaceAfterSemicolon` cop does auto-correction. ([@jonas054][])
* `SpaceAfterMethodName` cop does auto-correction. ([@jonas054][])
* `SpaceAroundBlockBraces` cop does auto-correction. ([@jonas054][])
* `SpaceAroundEqualsInParameterDefault` cop does auto-correction. ([@jonas054][])
* `SpaceAroundOperators` cop does auto-correction. ([@jonas054][])
* `SpaceBeforeModifierKeyword` cop does auto-correction. ([@jonas054][])
* `SpaceInsideHashLiteralBraces` cop does auto-correction. ([@jonas054][])
* `SpaceInsideBrackets` cop does auto-correction. ([@jonas054][])
* `SpaceInsideParens` cop does auto-correction. ([@jonas054][])
* `TrailingWhitespace` cop does auto-correction. ([@jonas054][])
* `TrailingBlankLines` cop does auto-correction. ([@jonas054][])
* `FinalNewline` cop does auto-correction. ([@jonas054][])
* New cop `CyclomaticComplexity` checks the cyclomatic complexity of methods against a configurable max value. ([@jonas054][])
* [#594](https://github.com/bbatsov/rubocop/pull/594): New parameter `EnforcedStyleForEmptyBraces` with values `space` and `no_space` (default) added to `SpaceAroundBlockBraces`. ([@jonas054][])
* [#603](https://github.com/bbatsov/rubocop/pull/603): New parameter `MinSize` added to `WordArray` to allow small string arrays, retaining the default (0). ([@claco][])

### Changes

* [#557](https://github.com/bbatsov/rubocop/pull/557): Configuration files for excluded files are no longer loaded. ([@jonas054][])
* [#571](https://github.com/bbatsov/rubocop/pull/571): The default rake task now runs RuboCop over itself! ([@nevir][])
* Encoding errors are reported as fatal offences rather than printed with red text. ([@jonas054][])
* `AccessControl` cop is now configurable with the `EnforcedStyle` option. ([@sds][])
* Split `AccessControl` cop to `AccessModifierIndentation` and `EmptyLinesAroundAccessModifier`. ([@bbatsov][])
* [#594](https://github.com/bbatsov/rubocop/pull/594): Add configuration parameter `EnforcedStyleForEmptyBraces` to `SpaceInsideHashLiteralBraces` cop, and change `EnforcedStyleIsWithSpaces` (values `true`, `false`) to `EnforcedStyle` (values `space`, `no_space`). ([@jonas054][])
* Coverage builds linked from the README page are enabled again. ([@jonas054][])

### Bugs fixed

* [#561](https://github.com/bbatsov/rubocop/pull/561): Handle properly negative literals in `NumericLiterals` cop. ([@bbatsov][])
* [#567](https://github.com/bbatsov/rubocop/pull/567): Register an offence when the last hash parameter has braces in `BracesAroundHashParameters` cop. ([@dblock][])
* `StringLiterals` cop no longer reports errors for character literals such as ?/. That should be done only by the `CharacterLiterals` cop. ([@jonas054][])
* Made auto-correct much less likely to crash due to conflicting corrections ("clobbering"). ([@jonas054][])
* [#565](https://github.com/bbatsov/rubocop/pull/565): `$GLOBAL_VAR from English library` should no longer be inserted when autocorrecting short-form global variables like `$!`. ([@nevir][])
* [#566](https://github.com/bbatsov/rubocop/pull/566): Methods that just assign a splat to an ivar are no longer considered trivial writers. ([@nevir][])
* [#585](https://github.com/bbatsov/rubocop/pull/585): `MethodCallParentheses` should allow methods starting with uppercase letter. ([@bbatsov][])
* [#574](https://github.com/bbatsov/rubocop/issues/574): Fix error on multiple-assignment with non-array right hand side in `UselessSetterCall`. ([@yujinakayama][])
* [#576](https://github.com/bbatsov/rubocop/issues/576): Output config validation warning to STDERR so that it won't be mixed up with formatter's output. ([@yujinakayama][])
* [#599](https://github.com/bbatsov/rubocop/pull/599): `EndOfLine` cop is operational again. ([@jonas054][])
* [#604](https://github.com/bbatsov/rubocop/issues/604): Fix error on implicit match conditionals (e.g. `if /pattern/; end`) in `FavorModifier`. ([@yujinakayama][])
* [#600](https://github.com/bbatsov/rubocop/pull/600): Don't require an empty line for access modifiers at the beginning of class/module body. ([@bbatsov][])
* [#608](https://github.com/bbatsov/rubocop/pull/608): `RescueException` no longer crashes when the namespace of a rescued class is in a local variable. ([@jonas054][])
* [#173](https://github.com/bbatsov/rubocop/issues/173): Allow the use of `alias` in the body of an `instance_exec`. ([@bbatsov][])
* [#554](https://github.com/bbatsov/rubocop/issues/554): Handle properly multi-line arrays with comments in them in `WordArray`. ([@bbatsov][])

## 0.14.1 (10/10/2013)

### New features

* [#551](https://github.com/bbatsov/rubocop/pull/551): New cop `BracesAroundHashParameters` checks for braces in function calls with hash parameters. ([@dblock][])
* New cop `SpaceAfterNot` tracks redundant space after the `!` operator. ([@bbatsov][])

### Bugs fixed

* Fix bug concerning table and separator alignment of multi-line hash with multiple keys on the same line. ([@jonas054][])
* [#550](https://github.com/bbatsov/rubocop/pull/550): Fix a bug where `ClassLength` counted lines of inner classes/modules. ([@yujinakayama][])
* [#550](https://github.com/bbatsov/rubocop/pull/550): Fix a false positive for namespace class in `Documentation`. ([@yujinakayama][])
* [#556](https://github.com/bbatsov/rubocop/pull/556): Fix "Parser::Source::Range spans more than one line" bug in clang formatter. ([@yujinakayama][])
* [#552](https://github.com/bbatsov/rubocop/pull/552): `RaiseArgs` allows exception constructor calls with more than one 1 argument. ([@bbatsov][])

## 0.14.0 (07/10/2013)

### New features

* [#491](https://github.com/bbatsov/rubocop/issues/491): New cop `MethodCalledOnDoEndBlock` keeps track of methods called on `do`...`end` blocks.
* [#456](https://github.com/bbatsov/rubocop/issues/456): New configuration parameter `AllCops`/`RunRailsCops` can be set to `true` for a project, removing the need to give the `-R`/`--rails` option with every invocation of `rubocop`.
* [#501](https://github.com/bbatsov/rubocop/issues/501): `simple`/`clang`/`progress`/`emacs` formatters now print `[Corrected]` along with offence message when the offence is automatically corrected.
* [#501](https://github.com/bbatsov/rubocop/issues/501): `simple`/`clang`/`progress` formatters now print count of auto-corrected offences in the final summary.
* [#501](https://github.com/bbatsov/rubocop/issues/501): `json` formatter now outputs `corrected` key with boolean value in offence objects whether the offence is automatically corrected.
* New cop `ClassLength` checks for overly long class definitions.
* New cop `Debugger` checks for forgotten calls to debugger or pry.
* New cop `RedundantException` checks for code like `raise RuntimeError, message`.
* [#526](https://github.com/bbatsov/rubocop/issues/526): New cop `RaiseArgs` checks the args passed to `raise/fail`.

### Changes

* Cop `MethodAndVariableSnakeCase` replaced by `MethodName` and `VariableName`, both having the configuration parameter `EnforcedStyle` with values `snake_case` (default) and `camelCase`.
* [#519](https://github.com/bbatsov/rubocop/issues/519): `HashSyntax` cop is now configurable and can enforce the use of the classic hash rockets syntax.
* [#520](https://github.com/bbatsov/rubocop/issues/520): `StringLiterals` cop is now configurable and can enforce either single-quoted or double-quoted strings.
* [#528](https://github.com/bbatsov/rubocop/issues/528): Added a config option to `RedundantReturn` to allow a `return` with multiple values.
* [#524](https://github.com/bbatsov/rubocop/issues/524): Added a config option to `Semicolon` to allow the use of `;` as an expression separator.
* [#525](https://github.com/bbatsov/rubocop/issues/525): `SignalException` cop is now configurable and can enforce the semantic rule or an exclusive use of `raise` or `fail`.
* `LambdaCall` is now configurable and enforce either `Proc#call` or `Proc#()`.
* [#529](https://github.com/bbatsov/rubocop/issues/529): Added config option `EnforcedStyle` to `SpaceAroundBraces`.
* [#529](https://github.com/bbatsov/rubocop/issues/529): Changed config option `NoSpaceBeforeBlockParameters` to `SpaceBeforeBlockParameters`.
* Support Parser 2.0.0 (non-beta).

### Bugs fixed

* [#514](https://github.com/bbatsov/rubocop/issues/514): Fix alignment of the hash containing different key lengths in one line.
* [#496](https://github.com/bbatsov/rubocop/issues/496): Fix corner case crash in `AlignHash` cop: single key/value pair when configuration is `table` for '=>' and `separator` for `:`.
* [#502](https://github.com/bbatsov/rubocop/issues/502): Don't check non-decimal literals with `NumericLiterals`.
* [#448](https://github.com/bbatsov/rubocop/issues/448): Fix auto-correction of parameters spanning more than one line in `AlignParameters` cop.
* [#493](https://github.com/bbatsov/rubocop/issues/493): Support disabling `Syntax` offences with `warning` severity.
* Fix bug appearing when there were different values for the `AllCops`/`RunRailsCops` configuration parameter in different directories.
* [#512](https://github.com/bbatsov/rubocop/issues/512): Fix bug causing crash in `AndOr` auto-correction.
* [#515](https://github.com/bbatsov/rubocop/issues/515): Fix bug causing `AlignParameters` and `AlignArray` auto-correction to destroy code.
* [#516](https://github.com/bbatsov/rubocop/issues/516): Fix bug causing `RedundantReturn` auto-correction to produce invalid code.
* [#527](https://github.com/bbatsov/rubocop/issues/527): Handle `!=` expressions in `EvenOdd` cop.
* `SignalException` cop now finds `raise` calls anywhere, not only in `begin` sections.
* [#538](https://github.com/bbatsov/rubocop/issues/538): Fix bug causing `Blocks` auto-correction to produce invalid code.

## 0.13.1 (19/09/2013)

### New features

* `HashSyntax` cop does auto-correction.
* [#484](https://github.com/bbatsov/rubocop/pull/484): Allow calls to self to fix name clash with argument.
* Renamed `SpaceAroundBraces` to `SpaceAroundBlockBraces`.
* `SpaceAroundBlockBraces` now has a `NoSpaceBeforeBlockParameters` config option to enforce a style for blocks with parameters like `{|foo| puts }`.
* New cop `LambdaCall` tracks uses of the obscure `lambda.(...)` syntax.

### Bugs fixed

* Fix crash on empty input file in `FinalNewline`.
* [#485](https://github.com/bbatsov/rubocop/issues/485): Fix crash on multiple-assignment and op-assignment in `UselessSetterCall`.
* [#497](https://github.com/bbatsov/rubocop/issues/497): Fix crash in `UselessComparison` and `NilComparison`.

## 0.13.0 (13/09/2013)

### New features

* New configuration parameter `AllowAdjacentOneLineDefs` for `EmptyLineBetweenDefs`.
* New cop `MultilineBlockChain` keeps track of chained blocks spanning multiple lines.
* `RedundantSelf` cop does auto-correction.
* `AvoidPerlBackrefs` cop does auto-correction.
* `AvoidPerlisms` cop does auto-correction.
* `RedundantReturn` cop does auto-correction.
* `Blocks` cop does auto-correction.
* New cop `TrailingBlankLines` keeps track of extra blanks lines at the end of source file.
* New cop `AlignHash` keeps track of bad alignment in multi-line hash literals.
* New cop `AlignArray` keeps track of bad alignment in multi-line array literals.
* New cop `SpaceBeforeModifierKeyword` keeps track of missing space before a modifier keyword (`if`, `unless`, `while`, `until`).
* New cop `FinalNewline` keeps tracks of the required final newline in a source file.
* Highlightling corrected in `SpaceInsideHashLiteralBraces` and `SpaceAroundBraces` cops.

### Changes

* [#447](https://github.com/bbatsov/rubocop/issues/447): `BlockAlignment` cop now allows `end` to be aligned with the start of the line containing `do`.
* `SymbolName` now has an `AllowDots` config option to allow symbols like `:'whatever.submit_button'`.
* [#469](https://github.com/bbatsov/rubocop/issues/469): Extracted useless setter call tracking part of `UselessAssignment` cop to `UselessSetterCall`.
* [#469](https://github.com/bbatsov/rubocop/issues/469): Merged `UnusedLocalVariable` cop into `UselessAssignment`.
* [#458](https://github.com/bbatsov/rubocop/issues/458): The merged `UselessAssignment` cop now has advanced logic that tracks not only assignment at the end of the method but also every assignment in every scope.
* [#466](https://github.com/bbatsov/rubocop/issues/466): Allow built-in JRuby global vars in `AvoidGlobalVars`.
* Added a config option `AllowedVariables` to `AvoidGlobalVars` to allow users to whitelist certain global variables.
* Renamed `AvoidGlobalVars` to `GlobalVars`.
* Renamed `AvoidPerlisms` to `SpecialGlobalVars`.
* Renamed `AvoidFor` to `For`.
* Renamed `AvoidClassVars` to `ClassVars`.
* Renamed `AvoidPerlBackrefs` to `PerlBackrefs`.
* `NumericLiterals` now accepts a config param `MinDigits` - the minimal number of digits in the integer portion of number for the cop to check it.

### Bugs fixed

* [#449](https://github.com/bbatsov/rubocop/issues/449): Remove whitespaces between condition and `do` with `WhileUntilDo` auto-correction.
* Continue with file inspection after parser warnings. Give up only on syntax errors.
* Don't trigger the HashSyntax cop on digit-starting keys.
* Fix crashes while inspecting class definition subclassing another class stored in a local variable in `UselessAssignment` (formerly of `UnusedLocalVariable`) and `ShadowingOuterLocalVariable` (like `clazz = Array; class SomeClass < clazz; end`).
* [#463](https://github.com/bbatsov/rubocop/issues/463): Do not warn if using destructuring in second `reduce` argument (`ReduceArguments`).

## 0.12.0 (23/08/2013)

### New features

* [#439](https://github.com/bbatsov/rubocop/issues/439): Added formatter 'OffenceCount' which outputs a summary list of cops and their offence count.
* [#395](https://github.com/bbatsov/rubocop/issues/395): Added `--show-cops` option to show available cops.
* New cop `NilComparison` keeps track of comparisons like `== nil`.
* New cop `EvenOdd` keeps track of occasions where `Fixnum#even?` or `Fixnum#odd?` should have been used (like `x % 2 == 0`).
* New cop `IndentationWidth` checks for files using indentation that is not two spaces.
* New cop `SpaceAfterMethodName` keeps track of method definitions with a space between the method name and the opening parenthesis.
* New cop `ParenthesesAsGroupedExpression` keeps track of method calls with a space before the opening parenthesis.
* New cop `HashMethods` keeps track of uses of deprecated `Hash` methods.
* New Rails cop `HasAndBelongsToMany` checks for uses of `has_and_belongs_to_many`.
* New Rails cop `ReadAttribute` tracks uses of `read_attribute`.
* `Attr` cop does auto-correction.
* `CollectionMethods` cop does auto-correction.
* `SignalException` cop does auto-correction.
* `EmptyLiteral` cop does auto-correction.
* `MethodCallParentheses` cop does auto-correction.
* `DefWithParentheses` cop does auto-correction.
* `DefWithoutParentheses` cop does auto-correction.

### Changes

* Dropped `-s`/`--silent` option. Now `progress`/`simple`/`clang` formatters always report summary and `emacs`/`files` formatters no longer report.
* Dropped the `LineContinuation` cop.

### Bugs fixed

* [#432](https://github.com/bbatsov/rubocop/issues/432): Fix false positive for constant assignments when rhs is a method call with block in `ConstantName`.
* [#434](https://github.com/bbatsov/rubocop/issues/434): Support classes and modules defined with `Class.new`/`Module.new` in `AccessControl`.
* Fix which ranges are highlighted in reports from IfUnlessModifier, WhileUntilModifier, and MethodAndVariableSnakeCase cop.
* [#438](https://github.com/bbatsov/rubocop/issues/438): Accept setting attribute on method argument in `UselessAssignment`.

## 0.11.1 (12/08/2013)

### Changes

* [#425](https://github.com/bbatsov/rubocop/issues/425): `ColonMethodCalls` now allows constructor methods (like `Nokogiri::HTML()` to be called with double colon.

### Bugs fixed

* [#427](https://github.com/bbatsov/rubocop/issues/427): FavorUnlessOverNegatedIf triggered when using elsifs.
* [#429](https://github.com/bbatsov/rubocop/issues/429): Fix `LeadingCommentSpace` offence reporting.
* Fixed `AsciiComments` offence reporting.
* Fixed `BlockComments` offence reporting.

## 0.11.0 (09/08/2013)

### New features

* [#421](https://github.com/bbatsov/rubocop/issues/421): `TrivialAccessors` now ignores methods on user-configurable whitelist (such as `to_s` and `to_hash`).
* [#369](https://github.com/bbatsov/rubocop/issues/369): New option `--auto-gen-config` outputs RuboCop configuration that disables all cops that detect any offences.
* The list of annotation keywords recognized by the `CommentAnnotation` cop is now configurable.
* Configuration file names are printed as they are loaded in `--debug` mode.
* Auto-correct support added in `AlignParameters` cop.
* New cop `UselessComparison` checks for comparisons of the same arguments.
* New cop `UselessAssignment` checks for useless assignments to local variables.
* New cop `SignalException` checks for proper usage of `fail` and `raise`.
* New cop `ModuleFunction` checks for usage of `extend self` in modules.

### Bugs fixed

* [#374](https://github.com/bbatsov/rubocop/issues/374): Fixed error at post condition loop (`begin-end-while`, `begin-end-until`) in `UnusedLocalVariable` and `ShadowingOuterLocalVariable`.
* [#373](https://github.com/bbatsov/rubocop/issues/373) and [#376](https://github.com/bbatsov/rubocop/issues/376): Allow braces around multi-line blocks if `do`-`end` would change the meaning of the code.
* `RedundantSelf` now allows `self.` followed by any ruby keyword.
* [#391](https://github.com/bbatsov/rubocop/issues/391): Fix bug in counting slashes in a regexp.
* [#394](https://github.com/bbatsov/rubocop/issues/394): `DotPosition` cop handles correctly code like `l.(1)`.
* [#390](https://github.com/bbatsov/rubocop/issues/390): `CommentAnnotation` cop allows keywords (e.g. Review, Optimize) if they just begin a sentence.
* [#400](https://github.com/bbatsov/rubocop/issues/400): Fix bug concerning nested defs in `EmptyLineBetweenDefs` cop.
* [#399](https://github.com/bbatsov/rubocop/issues/399): Allow assignment inside blocks in `AssignmentInCondition` cop.
* Fix bug in favor_modifier.rb regarding missed offences after else etc.
* [#393](https://github.com/bbatsov/rubocop/issues/393): Retract support for multiline chaining of blocks (which fixed [#346](https://github.com/bbatsov/rubocop/issues/346)), thus rejecting issue 346.
* [#389](https://github.com/bbatsov/rubocop/issues/389): Ignore symbols that are arguments to Module#private_constant in `SymbolName` cop.
* [#387](https://github.com/bbatsov/rubocop/issues/387): Do autocorrect in `AndOr` cop only if it does not change the meaning of the code.
* [#398](https://github.com/bbatsov/rubocop/issues/398): Don't display blank lines in the output of the clang formatter.
* [#283](https://github.com/bbatsov/rubocop/issues/283): Refine `StringLiterals` string content check.

## 0.10.0 (17/07/2013)

### New features

* New cop `RedundantReturn` tracks redundant `return`s in method bodies.
* New cop `RedundantBegin` tracks redundant `begin` blocks in method definitions.
* New cop `RedundantSelf` tracks redundant uses of `self`.
* New cop `EmptyEnsure` tracks empty `ensure` blocks.
* New cop `CommentAnnotation` tracks formatting of annotation comments such as TODO.
* Added custom rake task.
* New formatter `FileListFormatter` outputs just a list of files with offences in them (related to [#357](https://github.com/bbatsov/rubocop/issues/357)).

### Changes

* `TrivialAccessors` now has an `ExactNameMatch` config option (related to [#308](https://github.com/bbatsov/rubocop/issues/308)).
* `TrivialAccessors` now has an `ExcludePredicates` config option (related to [#326](https://github.com/bbatsov/rubocop/issues/326)).
* Cops don't inherit from `Parser::AST::Rewriter` anymore. All 3rd party Cops should remove the call to `super` in their callbacks. If you implement your own processing you need to define the `#investigate` method instead of `#inspect`. Refer to the documentation of `Cop::Commissioner` and `Cop::Cop` classes for more information.
* `EndAlignment` cop split into `EndAlignment` and `BlockAlignment` cops.

### Bugs fixed

* [#288](https://github.com/bbatsov/rubocop/issues/288): Work with absolute Excludes paths internally (2nd fix for this issue).
* `TrivialAccessors` now detects class attributes as well as instance attributes.
* [#338](https://github.com/bbatsov/rubocop/issues/338): Fix end alignment of blocks in chained assignments.
* [#345](https://github.com/bbatsov/rubocop/issues/345): Add `$SAFE` to the list of built-in global variables.
* [#340](https://github.com/bbatsov/rubocop/issues/340): Override config parameters rather than merging them.
* [#349](https://github.com/bbatsov/rubocop/issues/349): Fix false positive for `CharacterLiteral` (`%w(?)`).
* [#346](https://github.com/bbatsov/rubocop/issues/346): Support method chains for block end alignment checks.
* [#350](https://github.com/bbatsov/rubocop/issues/350): Support line breaks between variables on left hand side for block end alignment checks.
* [#356](https://github.com/bbatsov/rubocop/issues/356): Allow safe assignment in `ParenthesesAroundCondition`.

### Misc

* Improved performance on Ruby 1.9 by about 20%.
* Improved overall performance by about 35%.

## 0.9.1 (05/07/2013)

### New features

* Added `-l/--lint` option to allow doing only linting with no style checks (similar to running `ruby -wc`).

### Changes

* Removed the `BlockAlignSchema` configuration option from `EndAlignment`. We now support only the default alignment schema - `StartOfAssignment`.
* Made the preferred collection methods in `CollectionMethods` configurable.
* Made the `DotPosition` cop configurable - now both `leading` and `trailing` styles are supported.

### Bugs fixed

* [#318](https://github.com/bbatsov/rubocop/issues/318): Correct some special cases of block end alignment.
* [#317](https://github.com/bbatsov/rubocop/issues/317): Fix a false positive in `LiteralInCondition`.
* [#321](https://github.com/bbatsov/rubocop/issues/321): Ignore variables whose name start with `_` in `ShadowingOuterLocalVariable`.
* [#322](https://github.com/bbatsov/rubocop/issues/322): Fix exception of `UnusedLocalVariable` and `ShadowingOuterLocalVariable` when inspecting keyword splat argument.
* [#316](https://github.com/bbatsov/rubocop/issues/316): Correct nested postfix unless in `MultilineIfThen`.
* [#327](https://github.com/bbatsov/rubocop/issues/327): Fix false offences for block expression that span on two lines in `EndAlignment`.
* [#332](https://github.com/bbatsov/rubocop/issues/332): Fix exception of `UnusedLocalVariable` and `ShadowingOuterLocalVariable` when inspecting named captures.
* [#333](https://github.com/bbatsov/rubocop/issues/333): Fix a case that `EnsureReturn` throws an exception when ensure has no body.

## 0.9.0 (01/07/2013)

### New features

* Introduced formatter feature, enables custom formatted output and multiple outputs.
* Added progress formatter and now it's the default. (`--format progress`).
* Added JSON formatter. (`--format json`).
* Added clang style formatter showing the offending source. code. (`--format clang`). The `clang` formatter marks a whole range rather than just the starting position, to indicate more clearly where the problem is.
* Added `-f`/`--format` option to specify formatter.
* Added `-o`/`--out` option to specify output file for each formatter.
* Added `-r/--require` option to inject external Ruby code into RuboCop.
* Added `-V/--verbose-version` option that displays Parser version and Ruby version as well.
* Added `-R/--rails` option that enables extra Rails-specific cops.
* Added support for auto-correction of some offences with `-a`/`--auto-correct`.
* New cop `CaseEquality` checks for explicit use of `===`.
* New cop `AssignmentInCondition` checks for assignment in conditions.
* New cop `EndAlignment` tracks misaligned `end` keywords.
* New cop `Void` tracks uses of literals/variables/operators in possibly void context.
* New cop `Documentation` checks for top level class/module doc comments.
* New cop `UnreachableCode` tracks unreachable code segments.
* New cop `MethodCallParentheses` tracks unwanted braces in method calls.
* New cop `UnusedLocalVariable` tracks unused local variables for each scope.
* New cop `ShadowingOuterLocalVariable` tracks use of the same name as outer local variables for block arguments or block local variables.
* New cop `WhileUntilDo` tracks uses of `do` with multi-line `while/until`.
* New cop `CharacterLiteral` tracks uses of character literals (`?x`).
* New cop `EndInMethod` tracks uses of `END` in method definitions.
* New cop `LiteralInCondition` tracks uses of literals in the conditions of `if/while/until`.
* New cop `BeginBlock` tracks uses of `BEGIN` blocks.
* New cop `EndBlock` tracks uses of `END` blocks.
* New cop `DotPosition` tracks the dot position in multi-line method calls.
* New cop `Attr` tracks uses of `Module#attr`.
* Add support for auto-correction of some offences with `-a`/`--auto-correct`.

### Changes

* Deprecated `-e`/`--emacs` option. (Use `--format emacs` instead).
* Made `progress` formatter the default.
* Most formatters (`progress`, `simple` and `clang`) now print relative file paths if the paths are under the current working directory.
* Migrate all cops to new namespaces. `Rubocop::Cop::Lint` is for cops that emit warnings. `Rubocop::Cop::Style` is for cops that do not belong in other namespaces.
* Merge `FavorPercentR` and `PercentR` into one cop called `RegexpLiteral`, and add configuration parameter `MaxSlashes`.
* Add `CountKeywordArgs` configuration option to `ParameterLists` cop.

### Bugs fixed

* [#239](https://github.com/bbatsov/rubocop/issues/239): Fixed double quotes false positives.
* [#233](https://github.com/bbatsov/rubocop/issues/233): Report syntax cop offences.
* Fix off-by-one error in favor_modifier.
* [#229](https://github.com/bbatsov/rubocop/issues/229): Recognize a line with CR+LF as a blank line in AccessControl cop.
* [#235](https://github.com/bbatsov/rubocop/issues/235): Handle multiple constant assignment in ConstantName cop.
* [#246](https://github.com/bbatsov/rubocop/issues/246): Correct handling of unicode escapes within double quotes.
* Fix crashes in Blocks, CaseEquality, CaseIndentation, ClassAndModuleCamelCase, ClassMethods, CollectionMethods, and ColonMethodCall.
* [#263](https://github.com/bbatsov/rubocop/issues/263): Do not check for space around operators called with method syntax.
* [#271](https://github.com/bbatsov/rubocop/issues/271): Always allow line breaks inside hash literal braces.
* [#270](https://github.com/bbatsov/rubocop/issues/270): Fixed a false positive in ParenthesesAroundCondition.
* [#288](https://github.com/bbatsov/rubocop/issues/288): Get config parameter AllCops/Excludes from highest config file in path.
* [#276](https://github.com/bbatsov/rubocop/issues/276): Let columns start at 1 instead of 0 in all output of column numbers.
* [#292](https://github.com/bbatsov/rubocop/issues/292): Don't check non-regular files (like sockets, etc).
* Fix crashes in WordArray on arrays of character literals such as `[?\r, ?\n]`.
* Fix crashes in Documentation on empty modules.

## 0.8.3 (18/06/2013)

### Bug fixes

* Lock Parser dependency to version 2.0.0.beta5.

## 0.8.2 (06/05/2013)

### New features

* New cop `BlockNesting` checks for excessive block nesting.

### Bug fixes

* Correct calculation of whether a modifier version of a conditional statement will fit.
* Fix an error in `MultilineIfThen` cop that occurred in some special cases.
* [#231](https://github.com/bbatsov/rubocop/issues/231): Fix a false positive for modifier if.

## 0.8.1 (05/30/2013)

### New features

* New cop `Proc` tracks uses of `Proc.new`.

### Changes

* Renamed `NewLambdaLiteral` to `Lambda`.
* Aligned the `Lambda` cop more closely to the style guide - it now allows the use of `lambda` for multi-line blocks.

### Bugs fixed

* [#210](https://github.com/bbatsov/rubocop/issues/210): Fix a false positive for double quotes in regexp literals.
* [#211](https://github.com/bbatsov/rubocop/issues/211): Fix a false positive for `initialize` method looking like a trivial writer.
* [#215](https://github.com/bbatsov/rubocop/issues/215): Fixed a lot of modifier `if/unless/while/until` issues.
* [#213](https://github.com/bbatsov/rubocop/issues/213): Make sure even disabled cops get their configuration set.
* [#214](https://github.com/bbatsov/rubocop/issues/214): Fix SpaceInsideHashLiteralBraces to handle string interpolation right.

## 0.8.0 (05/28/2013)

### Changes

* Folded `ArrayLiteral` and `HashLiteral` into `EmptyLiteral` cop.
* The maximum number of params `ParameterLists` accepts in now configurable.
* Reworked `SymbolSnakeCase` into `SymbolName`, which has an option `AllowCamelCase` enabled by default.
* Migrated from `Ripper` to the portable [Parser](https://github.com/whitequark/parser).

### New features

* New cop `ConstantName` checks for constant which are not using `SCREAMING_SNAKE_CASE`.
* New cop `AccessControl` checks private/protected indentation and surrounding blank lines.
* New cop `Loop` checks for `begin/end/while(until)` and suggests the use of `Kernel#loop`.

## 0.7.2 (05/13/2013)

### Bugs fixed

* [#155](https://github.com/bbatsov/rubocop/issues/155): 'Do not use semicolons to terminate expressions.' is not implemented correctly.
* `OpMethod` now handles definition of unary operators without crashing.
* `SymbolSnakeCase` now handles aliasing of operators without crashing.
* `RescueException` now handles the splat operator `*` in a `rescue` clause without crashing.
* [#159](https://github.com/bbatsov/rubocop/issues/159): AvoidFor cop misses many violations.

## 0.7.1 (05/11/2013)

### Bugs fixed

* Added missing files to the gemspec.

## 0.7.0 (05/11/2013)

### New features

* Added ability to include or exclude files/directories through `.rubocop.yml`.
* Added option --only for running a single cop.
* Relax semicolon rule for one line methods, classes and modules.
* Configuration files, such as `.rubocop.yml`, can now include configuration from other files through the `inherit_from` directive. All configuration files implicitly inherit from `config/default.yml`.
* New cop `ClassMethods` checks for uses for class/module names in definitions of class/module methods.
* New cop `SingleLineMethods` checks for methods implemented on a single line.
* New cop `FavorJoin` checks for usages of `Array#*` with a string argument.
* New cop `BlockComments` tracks uses of block comments(`=begin/=end` comments).
* New cop `EmptyLines` tracks consecutive blank lines.
* New cop `WordArray` tracks arrays of words.
* [#108](https://github.com/bbatsov/rubocop/issues/108): New cop `SpaceInsideHashLiteralBraces` checks for spaces inside hash literal braces - style is configurable.
* New cop `LineContinuation` tracks uses of the line continuation character (`\`).
* New cop `SymbolArray` tracks arrays of symbols.
* Print warnings for unrecognized names in configuration files.
* New cop `TrivialAccessors` tracks method definitions that could be automatically generated with `attr_*` methods.
* New cop `LeadingCommentSpace` checks for missing space after `#` in comments.
* New cop `ColonMethodCall` tracks uses of `::` for method calls.
* New cop `AvoidGlobalVars` tracks uses of non built-in global variables.
* New cop `SpaceAfterControlKeyword` tracks missing spaces after `if/elsif/case/when/until/unless/while`.
* New cop `Not` tracks uses of the `not` keyword.
* New cop `Eval` tracks uses of the `eval` function.

### Bugs fixed

* [#101](https://github.com/bbatsov/rubocop/issues/101): `SpaceAroundEqualsInParameterDefault` doesn't work properly with empty string.
* Fix `BraceAfterPercent` for `%W`, `%i` and `%I` and added more tests.
* Fix a false positive in the `Alias` cop. `:alias` is no longer treated as keyword.
* `ArrayLiteral` now properly detects `Array.new`.
* `HashLiteral` now properly detects `Hash.new`.
* `VariableInterpolation` now detects regexp back references and doesn't crash.
* Don't generate pathnames like some/project//some.rb.
* [#151](https://github.com/bbatsov/rubocop/issues/151): Don't print the unrecognized cop warning several times for the same `.rubocop.yml`.

### Misc

* Renamed `Indentation` cop to `CaseIndentation` to avoid confusion.
* Renamed `EmptyLines` cop to `EmptyLineBetweenDefs` to avoid confusion.

## 0.6.1 (04/28/2013)

### New features

* Split `AsciiIdentifiersAndComments` cop in two separate cops.

### Bugs fixed

* [#90](https://github.com/bbatsov/rubocop/issues/90): Two cops crash when scanning code using `super`.
* [#93](https://github.com/bbatsov/rubocop/issues/93): Issue with `whitespace?': undefined method`.
* [#97](https://github.com/bbatsov/rubocop/issues/97): Build fails.
* [#100](https://github.com/bbatsov/rubocop/issues/100): `OpMethod` cop doesn't work if method arg is not in braces.
* `SymbolSnakeCase` now tracks Ruby 1.9 hash labels as well as regular symbols.

### Misc

* [#88](https://github.com/bbatsov/rubocop/issues/88): Abort gracefully when interrupted with Ctrl-C.
* No longer crashes on bugs within cops. Now problematic checks are skipped and a message is displayed.
* Replaced `Term::ANSIColor` with `Rainbow`.
* Add an option to disable colors in the output.
* Cop names are now displayed alongside messages when `-d/--debug` is passed.

## 0.6.0 (04/23/2013)

### New features

* New cop `ReduceArguments` tracks argument names in reduce calls.
* New cop `MethodLength` tracks number of LOC (lines of code) in methods.
* New cop `RescueModifier` tracks uses of `rescue` in modifier form.
* New cop `PercentLiterals` tracks uses of `%q`, `%Q`, `%s` and `%x`.
* New cop `BraceAfterPercent` tracks uses of % literals with delimiters other than ().
* Support for disabling cops locally in a file with rubocop:disable comments.
* New cop `EnsureReturn` tracks usages of `return` in `ensure` blocks.
* New cop `HandleExceptions` tracks suppressed exceptions.
* New cop `AsciiIdentifiersAndComments` tracks uses of non-ascii characters in identifiers and comments.
* New cop `RescueException` tracks uses of rescuing the `Exception` class.
* New cop `ArrayLiteral` tracks uses of Array.new.
* New cop `HashLiteral` tracks uses of Hash.new.
* New cop `OpMethod` tracks the argument name in operator methods.
* New cop `PercentR` tracks uses of %r literals with zero or one slash in the regexp.
* New cop `FavorPercentR` tracks uses of // literals with more than one slash in the regexp.

### Bugs fixed

* [#62](https://github.com/bbatsov/rubocop/issues/62): Config files in ancestor directories are ignored if another exists in home directory.
* [#65](https://github.com/bbatsov/rubocop/issues/65): Suggests to convert symbols `:==`, `:<=>` and the like to snake_case.
* [#66](https://github.com/bbatsov/rubocop/issues/66): Does not crash on unreadable or unparseable files.
* [#70](https://github.com/bbatsov/rubocop/issues/70): Support `alias` with bareword arguments.
* [#64](https://github.com/bbatsov/rubocop/issues/64): Performance issue with Bundler.
* [#75](https://github.com/bbatsov/rubocop/issues/75): Make it clear that some global variables require the use of the English library.
* [#79](https://github.com/bbatsov/rubocop/issues/79): Ternary operator missing whitespace detection.

### Misc

* Dropped Jeweler for gem release management since it's no longer actively maintained.
* Handle pluralization properly in the final summary.

## 0.5.0 (04/17/2013)

### New features

* New cop `FavorSprintf` that checks for usages of `String#%`.
* New cop `Semicolon` that checks for usages of `;` as expression separator.
* New cop `VariableInterpolation` that checks for variable interpolation in double quoted strings.
* New cop `Alias` that checks for uses of the keyword `alias`.
* Automatically detect extensionless Ruby files with shebangs when search for Ruby source files in a directory.

### Bugs fixed

* [#59](https://github.com/bbatsov/rubocop/issues/59): Interpolated variables not enclosed in braces are not noticed.
* [#42](https://github.com/bbatsov/rubocop/issues/42): Received malformed format string ArgumentError from rubocop.

[@bbatsov]: https://github.com/bbatsov
[@jonas054]: https://github.com/jonas054
[@yujinakayama]: https://github.com/yujinakayama
[@dblock]: https://github.com/dblock
[@nevir]: https://github.com/nevir
[@daviddavis]: https://github.com/daviddavis
[@sds]: https://github.com/sds
[@fancyremarker]: https://github.com/fancyremarker
[@sinisterchipmunk]: https://github.com/sinisterchipmunk
[@vonTronje]: https://github.com/vonTronje
[@agrimm]: https://github.com/agrimm
[@pmenglund]: https://github.com/pmenglund
[@chulkilee]: https://github.com/chulkilee
[@codez]: https://github.com/codez
[@emou]: https://github.com/emou
[@skanev]: http://github.com/skanev
[@claco]: http://github.com/claco
[@rifraf]: http://github.com/rifraf
[@scottmatthewman]: https://github.com/scottmatthewman
[@ma2gedev]: http://github.com/ma2gedev
[@jeremyolliver]: https://github.com/jeremyolliver
[@hannestyden]: https://github.com/hannestyden
[@geniou]: https://github.com/geniou
[@jkogara]: https://github.com/jkogara
[@tmorris-fiksu]: https://github.com/tmorris-fiksu
[@mockdeep]: https://github.com/mockdeep
[@hiroponz]: https://github.com/hiroponz
[@tamird]: https://github.com/tamird
[@fshowalter]: https://github.com/fshowalter
[@cschramm]: https://github.com/cschramm
[@bquorning]: https://github.com/bquorning
[@bcobb]: https://github.com/bcobb
[@irrationalfab]: https://github.com/irrationalfab
[@tommeier]: https://github.com/tommeier
[@sfeldon]: https://github.com/sfeldon
[@biinari]: https://github.com/biinari
[@barunio]: https://github.com/barunio
[@molawson]: https://github.com/molawson
[@wndhydrnt]: https://github.com/wndhydrnt
[@ggilder]: https://github.com/ggilder
[@salbertson]: https://github.com/salbertson
