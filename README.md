# docker-nexus-pro
[Jira Card](https://issues.gwl.ca/browse/SDE-2770)

## Objective
To prove, verify and prototype the capability to run Nexus Pro 3 (either open-source or licensed) in a containerized environment.

## Why?
We want the ability to be able to stand-up our tools to be highly resilient, fault-tolerant and highly available; by moving our tool stack to Docker we are able to take advantage of isolation, resilience and health checking capabilities.

As we move forward with orchestrated workloads, we can take advantage of shared persistent storage across the cluster to automatically reschedule failed workloads.

## Approach
There are three components to the GWL Nexus Pro Docker solution:
* Nexus Pro
* Socat
* Traefik

### Nexus Pro
Sonatype provide a Docker Hub image of Nexus 3 based on CentOS and configurable for open-source (OSS) or Pro (license) capabilities.

> Compare the cspabilities of OSS v. Pro at [Version Comparison](https://www.sonatype.com/nexus-repository-oss-vs.-pro-features)

This image is used as the basis of the GWL docker-nexus-pro image and then modified to include a HEALTHCHECK directive to ensure that the app is responding to requests.

