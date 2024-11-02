# tf-fastly-edge-compute

## rust

### setup

mkdir external/tf-fastly-edge-compute
cd external/tf-fastly-edge-compute
fastly compute init --language "rust" --author "<myemail@domain.com>" --auto-yes --non-interactive

### rename package name (defaults to fastly-compute-project)

sed -i "s/^name = .*/name = \"tf-fastly-edge-compute\"/" ./Cargo.toml
sed -i "s/--bin .*/--bin tf-fastly-edge-compute --release --target wasm32-wasi --color always\"/" ./fastly.toml

### add dependencies

cargo add fastly --manifest-path tf-fastly-edge-compute/Cargo.toml

### compile

fastly compute build

## terraform

### set fastly api key

export FASTLY_API_KEY="afastlyapikey"

### terraform apply

terraform init

terraform plan

terraform apply --auto-approve
