# Third-Party Actions Setup

This repository defines which actions will be collected into an organizational third-party-actions repository.

## Configuration

1. Create a third-party-actions repository to contain the managed actions
1. Disable actions from running in the third-party-actions repository
1. Create an SSH keypair to use as a deploy key
1. Add the public key as a deploy key to the corresponding third-party-actions repository
1. Add the private as a secret to this repository as `APP_SSH_KEY`

## Adding a managed action

1. Run the add-action script with the action name and major version tag to add a versioned submodule.
    - eg. `./add-action.sh actions/checkout v4`
    - This script will:
        - Add the action as a submodule
        - Create a new branch
        - Commit the changes to the new branch
        - Push the branch to the repository for review
1. Merge the resulting branch into `main` to deploy the action to the corresponding third-party-actions repository as a versioned branch

## Using a managed action

Managed actions are published onto a branch with the same name as the checkout path.
- eg. `actions/checkout/v4` exists on the branch `actions/checkout/v4`

To use managed actions in your workflows use a statement like the following:

    - uses: <organization>/third-party-actions@actions/checkout/v4

Updates to these actions will be picked up by your dependent workflows without needing changes.
