# yeoman bower-install step

Executes the `bower install` command with leveraging the wercker cache mechanism to improve installation time.

This step is compatible with box-yeoman and expects bower to be installed globally. 

This way there is no need to change the yeoman generated package.json

## Example

    - bower-install
