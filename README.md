# aws-lza

# Validate config
Note doesn't pick up everything, only checks schema on certain files - but is quick
```
docker run --rm -v (pwd):/lza-config rdkls/aws-lza:latest validate-config /lza-config
```

# CDK Synth
Run cdk synth - will pick up everything  
**Note this mounts your AWS creds into the container**
Note also this may require more mem, if it gets killed try e.g. colima stop && colima start --memory 4

```
docker run \
                --workdir /app/source/packages/@aws-accelerator/accelerator \
                --rm \
                -v `pwd`:/lza-config \
                -v ${HOME}/.aws:/home/node/.aws \
                rdkls/aws-lza:latest \
                run ts-node --transpile-only cdk.ts synth --require-approval never --config-dir /lza-config --partition aws
```
