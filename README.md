## Contents

- v1-sc4s is the original version of the app, used to develop and test AxoRouter classification and parsing
- axoflow_forwarder is the current version, that can be installed without affecting to the original configuration of the HF

Further instructions about the usage can be found in the [package readme](axoflow_forwarder/README.md)

To build the app with the same version, run:
```
make build-package
```

To run the verification functionality of the Splunk Packaging Toolkit, run:
```
make validate-package
```

Updating the package version

Currently two files need to be updated to ensure a successful version bump:

- ./axoflow_forwarder/app.manifest
- ./axoflow_forwarder/default/app.conf
