# Variables
let try_counter=0
let max_retries=3
let in_error=0

if [[ "$OSTYPE" == "darwin"* ]]; then
    md5fn="md5"
else
    md5fn="md5sum"
fi
#prefix=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
prefix=$(date | $md5fn | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

global_return=""
global_status=""
# nexus_volumes=("${prefix}_nexus_pd","${prefix}_nexus_ur","${prefix}_nexus_blobs")
# nexus_networks=("${prefix}_nexus_net","${prefix}_management_net")
nexus_volumes=("nexus_pd" "nexus_ur" "nexus_blobs")
nexus_networks=("nexus_net" "management_net")
