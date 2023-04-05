# docs-doxygen 

pkgsite submodule for inclusion in SDKs that want documentation published using pkgsite, and part of the `docs-docker-base` image.

To use this, create a `documentation` folder at the root of your SDK (sub)module.

In the `documentation` folder, clone this repository:

`git submodule add git@github.com:PixoVR/docs-pkgsite.git`

now you have `documentation/docs-pkgsite`.

In the `documentation/docs-pkgsite` folder, run the `setup_submodule.sh` script to initialize folders and copy templates.

 - Modify the `env.sh` file as needed.
 - Add your SDK to the `docs-root` repository, with this submodule added and committed.
 - Link the CI/CD tools with the `main` repository of your SDK, and make sure documentation changes are merged into the `main` branch.

Please note that you really don't want to change the contents of this submodule for any individual implementation.
The `setup_submodule.sh` makes copies of scripts, files, and folders needed to customize any individual documentation implemnentation.

The intention is to be able to globally change colors, skin, functionality, theme, etc, and republish all documentation as needed
without having to modify any individual documentation set.

Visual design changes for pkgsite can be made in the static folder, however as of this writing, the process won't be smooth
because it is not clear how to publish those changes.  Ideally `start_pkgsite.sh` would use the "static" folder in this repo,
but it doesn't seem to work reliably, and the -static flag is commented in `start_pkgsite.sh`.  So for now, we use the default
design and move on.

