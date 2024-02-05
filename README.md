# renovate-config

![Validate](https://github.com/capraconsulting/renovate-config/workflows/Validate/badge.svg)

[Renovate config presets](https://docs.renovatebot.com/config-presets/)
for some Capra projects.

See [Configuration Options](https://docs.renovatebot.com/configuration-options/)
for a complete list of possible options.

## Preset strategy

This central Renovate configuration can be used both by repositories in capralifecycle, and repositories in other
organizations. This is possible because we split the configuration of credentials, which cannot be referred to or
even overridden in another organization (see https://github.com/renovatebot/renovate/discussions/26987), into a separate
preset _with-credentials.json_. This is why there are sets of presets (for example _default-base.json_ and _default.json_)
with similar names. Internal consumers in the capralifecycle organization can use presets that include both configuration
and credentials, while external consumers can only use presets specifying configuration, and must define credentials
separately in their own repository or organization.

1. **External consumers**: Use the presets with the "base" suffix, for example _default-base.json_. These presets
contain configuration, but not credentials for Github Packages. The consumers must define their own credentials to use with
Github Packages.
2. **Internal consumers**: Use the presets without the "base" suffix, for example _default.json_. These presets extend the
base configuration (for example _default-base.json_) and the preset containing credentials _with-credentials.json_.

## Usage

For most code bases - using [`default.json`](./default.json) ([`default-base.json`](./default-base.json) for external
consumers):

```json
{
  "extends": ["github>capralifecycle/renovate-config:default"]
}
```

For libraries - using [`library.json`](./library.json) ([`library-base.json`](./library-base.json) for external
consumers):

```json
{
  "extends": ["github>capralifecycle/renovate-config:library"]
}
```

For aggressive merging - using [`aggressive.json`](./aggressive.json) ([`aggressive-base.json`](./aggressive-base.json) for external
consumers):

```json
{
  "extends": ["github>capralifecycle/renovate-config:aggressive"]
}
```

This will schedule at any time and automerge as much as possible,
excluding major updates.

For automerging only within office hours - using [`office-hours.json`](./office-hours.json)([`office-hours-base.json`](./office-hours-base.json)
for external consumers):

```json
{
  "extends": ["github>capralifecycle/renovate-config:office-hours"]
}
```

## Validating configuration files

To validate configuration files against the Renovate JSON Schema, run the `validate.sh`-script.

```sh
$ ./validate.sh
Fetching latest JSON Schema
Migrating schema to newer version
saved migrated schema to renovate-schema.json
Now validating..
Validating aggressive.json
...
```
