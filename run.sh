export CI=true
export BOWER_STORAGE__CACHE="${WERCKER_CACHE_DIR}/wercker/bower"
mkdir -p $BOWER_STORAGE__CACHE
mkdir -p $BOWER_STORAGE__CACHE/.bower-cache
mkdir -p $BOWER_STORAGE__CACHE/.bower-registry
mkdir -p $BOWER_STORAGE__CACHE/.bower-tmp

# First make sure  is installed
if ! type bower &> /dev/null ; then
    # Check if it is in repo
    if ! $(npm_package_is_installed bower) ; then
        info "bower not installed, trying to install it through npm"

        if ! type npm &> /dev/null ; then
            fail "npm not found, make sure you have npm or bower installed"
        else
            info "npm is available"
            debug "npm version: $(npm --version)"

            info "installing bower"
            npm config set ca "" --silent
            sudo npm install npm -g --silent
            sudo npm install -g --silent bower
            bower_command="bower"
        fi
    else
        info "bower is available locally"
        debug "bower version: $(node ./node_modules/bower/bin/bower --version)"
        bower_command="node ./node_modules/bower/bin/bower"
    fi
else
    info "bower is available"
    debug "bower version: $(bower --version)"
    bower_command="bower"
fi

bower_command install \
    --config.interactive=false \
    --config.storage.packages=$BOWER_STORAGE__CACHE/.bower-cache \
    --config.storage.registry=$BOWER_STORAGE__CACHE/.bower-registry \
    --config.tmp=$BOWER_STORAGE__CACHE/.bower-tmp

set +e
$bower_command
result="$?"
set -e

# Fail if it is not a success or warning
if [[ result -ne 0 && result -ne 6 ]]
then
    warn "$result"
    fail "bower command failed"
else
    success "finished $bower_command"
fi
