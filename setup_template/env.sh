#!/bin/bash

export PROJECT_NAME='Name of project'					# should be short enough to fit on the documentation page
export PROJECT_VERSION=`cd ../; git tag | tail -n 1`			# the last tagged version
export PROJECT_BRIEF='Documentation for the Xyzproject Golang Library'	# a brief description of the SDK or module
export PROJECT_STATUS='active'						# project status, for publishing.  Recognized choices are 'active' (default if not present), 'inactive' (invisable and won't appear in the documentation menu), 'deprecated' (visible in menu, but marked deprecated)
export PROJECT_LOGO='docs-pkgsite/defaultIcon.png'			# an icon for the submodule, or 'docs-doxygen/doxygen-custom/defaultIcon.png'.  Path is relative to the folder containing `build.sh`.
export PROJECT_REPO='https://github.com/PixoVR/somerepo'		# the project repo url, for cloning
export PROJECT_URL='/SomeSDK-Target'					# subfolder used for documentation: 'https://docs.pixovr.com/SomeSDK-Target', like 'ApexSDK-Unreal'
export PROJECT_URL_HOME='$PROJECT_URL'					# the project home url.  This is the page that the main menu button actually links to.  This is just if you don't want to open on the default page.
export DEV_PROJECT_URL='../../../../platform/SomeSDK-Target/documentation/html/index.html'	# a url for local development, which is used when `docs-root` is publishing on a local system via `DEV=true ./build.sh`.  This will usually just be to replace `SomeSDK-Target` with the repo name.
#export PROJECT_MAIN_PAGE='../pages/mainpage.md'				# the main home markdown page for the documentation

# user variables.  Useful when writing pages that refer to other urls, but don't want to hardcode them in.  For instance, use `$(APEX_SERVER_URL)` in a markdown page to resolve the variable reference.
#export APEX_SERVER_URL='https://apex.pixovr.com'
