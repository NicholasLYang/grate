# Changelog

All changes will be documented in this file

## [0.1.2]
### Added
- Added a `server` command to grate cli.
- Added a bin directory to locally run grate cli.

### Changed
- Renamed `ProjectNameApplication` to just `Application` (to make
  running server easier)
- Moved application to `config/application.rb`

## [0.1.1]
### Changed
- Fixed casing for initial project generation. Before, `snake-case`
names would generate an application called `Snake-caseApplication`,
which would break.

- Added a changelog (kinda meta, eh?)


## [0.1.0]
### Changed
Released first version. Super minimal, contains:
- A server via rack
- A basic interface to GraphQL Ruby
- One simple query DSL (`queryable_on`)
- A generator for new project

