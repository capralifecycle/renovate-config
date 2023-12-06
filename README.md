# renovate-config

![Validate](https://github.com/capraconsulting/renovate-config/workflows/Validate/badge.svg)

[Renovate config presets](https://docs.renovatebot.com/config-presets/)
for some Capra projects.

See [Configuration Options](https://docs.renovatebot.com/configuration-options/)
for a complete list of possible options.

## Usage

For most code bases - using [`default.json`](./default.json):

```json
{
  "extends": ["github>capraconsulting/renovate-config:default"]
}
```

For libraries - using [`library.json`](./library.json):

```json
{
  "extends": ["github>capraconsulting/renovate-config:library"]
}
```

For aggressive merging - using [`aggressive.json`](./aggressive.json):

```json
{
  "extends": ["github>capraconsulting/renovate-config:aggressive"]
}
```

This will schedule at any time and automerge as much as possible,
excluding major updates.

For automerging only within office hours - using [`office-hours.json`](./office-hours.json):

```json
{
  "extends": ["github>capraconsulting/renovate-config:office-hours"]
}
```

