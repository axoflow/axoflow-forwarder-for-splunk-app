### Purpose

Forward logs to the Axoflow Platform from Splunk Heavy Forwarders.

### Build and validate

To build the app with the same version, run:
```
make build-package
```

To run the verification functionality of the Splunk Packaging Toolkit, run:
```
make validate-package
```

### Release

Currently two files need to be updated to ensure a successful version bump:

- ./axoflow_forwarder/app.manifest
- ./axoflow_forwarder/default/app.conf

Once versions are updated simply create a tag to trigger a new github release.
