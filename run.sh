export CI=true
export BOWER_STORAGE__CACHE="${WERCKER_CACHE_DIR}/wercker/bower"
mkdir -p $BOWER_STORAGE__CACHE
mkdir -p $BOWER_STORAGE__CACHE/.bower-cache
mkdir -p $BOWER_STORAGE__CACHE/.bower-registry
mkdir -p $BOWER_STORAGE__CACHE/.bower-tmp
bower install --config.interactive=false --config.storage.packages=$BOWER_STORAGE__CACHE/.bower-cache --config.storage.registry=$BOWER_STORAGE__CACHE/.bower-registry --config.tmp=$BOWER_STORAGE__CACHE/.bower-tmp 
