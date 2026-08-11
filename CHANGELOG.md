# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Run the sync script automatically on Renovate vendir branches and push the result for review.
- Add a check which fails a pull request if the sync script was not run.

### Changed

- Update upstream chart to v4.3.0.

## [0.1.1] - 2026-03-05

### Changed

- Wrap PolicyException manifest in API capabilities check.

## [0.1.0] - 2026-03-02

### Added

- Add upstream chart at v4.2.4.

[Unreleased]: https://github.com/giantswarm/multus-cni/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/giantswarm/multus-cni/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/giantswarm/multus-cni/releases/tag/v0.1.0
