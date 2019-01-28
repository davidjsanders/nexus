for net in ${nexus_networks[@]}
do
    createNetwork "${net}"
    step_info "Networks" "${global_status}"
done
