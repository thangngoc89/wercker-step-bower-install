# bower-install step

Executes the `bower install` command with leveraging the wercker cache mechanism to improve installation time.

This step has the `--allow-root` option set to enable installation in a Docker enviroment.

## Example

    - bower-install
