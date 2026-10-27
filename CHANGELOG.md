# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- Use the `giantswarm-release` GitHub App instead of the taylorbot personal access token to push sync commits.
- Update upstream multus-cni chart to v4.3.1.
- Update architect to v10.10.0 (giantswarm/multus-cni#40)
- Update architect to v10.11.1 (giantswarm/multus-cni#41)
- Update architect to v10.12.0 (giantswarm/multus-cni#43)
- Update architect to v10.12.1 (giantswarm/multus-cni#44)
- Update architect to v10.12.2 (giantswarm/multus-cni#46)
- Add Github action to create an issue in `giantswarm/giantswarm` for Team Rocket on vendir updates.
- Update architect to v10.13.1 (giantswarm/multus-cni#50)
- Update architect to v10.13.2 (giantswarm/multus-cni#51)
- Update architect to v10.13.4 (giantswarm/multus-cni#53)
- Update architect to v10.14.7 (giantswarm/multus-cni#58)
- Update carvel-dev/vendir to v0.46.3 (giantswarm/multus-cni#63)
- Update architect to v10.14.9 (giantswarm/multus-cni#64)
- Update architect to v10.14.10 (giantswarm/multus-cni#65)
- Update actions/create-github-app-token to v3.3.0 (giantswarm/multus-cni#69)
- Update architect to v10.14.18 (giantswarm/multus-cni#70)
- Update architect to v10.15.1 (giantswarm/multus-cni#71)
- Update architect to v10.16.3 (giantswarm/multus-cni#72)
- Update architect to v10.16.5 (giantswarm/multus-cni#74)

### Fixed

- Fix changelog generation script.

### Added

- Run the sync script automatically on Renovate vendir branches and push the result for review.
- Add a check which fails a pull request if the sync script was not run.
- Update upstream chart to v4.3.0.
- Add shared helpers file to sync dir.

## [0.1.1] - 2026-03-05

### Changed

- Wrap PolicyException manifest in API capabilities check.

## [0.1.0] - 2026-03-02

### Added

- Add upstream chart at v4.2.4.

[Unreleased]: https://github.com/giantswarm/multus-cni/compare/v0.1.1...HEAD
[0.1.1]: https://github.com/giantswarm/multus-cni/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/giantswarm/multus-cni/releases/tag/v0.1.0
