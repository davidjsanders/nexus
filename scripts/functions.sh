# Define functions
function errorHandler() {
    if [[ "${2}" == "0" ]]; then return; fi
    printf "${0}: Error - $1 (code $2)\n"
    exit $2
}

function checkVolume() {
    if [ -z "${1+x}" ]; then return 1; fi
    global_return=$(docker volume ls --format='{{.Name}}' --filter='name='${1} | grep -w "${1}")
    if [[ "${global_return}" == "${1}" ]]; then return 0; fi
    return 1
}

function createVolume() {
    if [ -z "${1+x}" ]; 
    then 
        errorHandler "createVolume called without volume name!" 1; 
    fi

    checkVolume "${1}"
    if [[ "$?" != "0" ]]
    then
        ret=$(docker volume create ${1})
        errorHandler "createVolume: Docker error ${ret}" $?
        global_status="Created volume ${1}"
    else
        global_status="Validated volume ${1} exists"
    fi
    return 0
}

function checkNetwork() {
    if [ -z "${1+x}" ]; then return 1; fi
    global_return=$(docker network ls --format='{{.Name}}' --filter='name='${1} | grep -w "${1}")
    if [[ "${global_return}" == "${1}" ]]; then return 0; fi
    return 1
}

function createNetwork() {
    if [ -z "${1+x}" ]; 
    then 
        errorHandler "createNetwork called without network name!" 1; 
    fi

    checkNetwork "${1}"
    if [[ "$?" != "0" ]]
    then
        ret=$(docker network create ${1} --driver=bridge)
        errorHandler "createNetwork: Docker error ${ret}" $?
        global_status="Created network ${1}"
    else
        global_status="Validated network ${1} exists"
    fi
    return 0
}

function step_info() {
    echo "${1} -- ${2}"
}