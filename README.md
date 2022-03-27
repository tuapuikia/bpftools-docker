## This repo provides dockerfile to build the Cloudflare BPF tool
[Cloudflare bpftool](https://github.com/cloudflare/bpftools).
Please read the official documentation before deploying the rules to the production server.

## How to build the image.

`docker buildx build --push -t <myrepo>/bpftool:latest .`

## How to use the Cloudflare bpftool

#### Privileged mode for applying the rules to the localhost.
`docker run -ti --pull always --rm --network host  --privileged --entrypoint bash tuapuikia/bpftools`

#### Non-privileged mode for generating script and testing purposes.
`docker run -ti --pull always --rm --entrypoint bash tuapuikia/bpftools`

## Basic usage

### Generate bytecode for *.*.example.com DNS

`./bpfgen dns -- -i *.*.example.com`

### Generate iptables script to include the DNS filter.

`./iptables_bpf dns -- -i *.*.example.com`
Generated file 'bpf_dns_ip4_any_any_example_com.sh'

### Apply the rule to the DNS server.

Please review the ./bpf_dns_ip4_any_any_example_com.sh the script. Default it is using the default route interface.
`./bpf_dns_ip4_any_any_example_com.sh <my DNS IP>
