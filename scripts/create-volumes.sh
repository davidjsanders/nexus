for vol in ${nexus_volumes[@]}
do
    createVolume "${vol}"
    step_info "Volumes " "${global_status}"
done
