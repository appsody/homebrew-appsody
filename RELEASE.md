# How to make this asset available
This asset is the Homebrew tap for the Appsody CLI. It contains the formula that developers use to install or upgrade their Appsody CLI installation. 

The release process for this asset is tightly connected with the release of the Appsody CLI. Here is a description of the lifecycle of the asset:
1) When a new release of the Appsody CLI is successfully made available, the release process automatically creates a new branch in the GitHub repo that contains this asset. The branch is named after the Travis build that is associated with the generation of the new Appsody CLI release.
1) The maintainers of this asset will then review the new branch, which contains an updated Homebrew formula, and create a Pull Request against the master branch.
1) The maintainers will then review the PR and, if everything is correct, approve it. At that point, users will be able to `brew install` or `brew upgrade` their Appsody installation.

# Release schedule
This asset must be released soon after a new release of the Appsody CLI is created.

# Dependencies
This asset has no dependencies on other assets in order to be built and released.

However, it is necessary to complete the release of this asset as soon as a new branch is created by the release process of the Appsody CLI.