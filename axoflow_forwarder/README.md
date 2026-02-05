Axoflow Forwarder Add-on


## OVERVIEW

Installing this add-on will allow Splunk Heavy Forwarder nodes to forward logs to the [Axoflow Platform](https://axoflow.com/axoflow-platform/).


## LICENSE

Copyright (c) 2025 Axoflow, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0


## NOTICE

This application can live besides existing Splunk config. In order to keep existing behaviour of the Heavy Forwarder
intact the defaultGroup for the `[tcpout]` stanza must be configured and must not contain the `axoflow` group.  

On a fresh Splunk instance where no forwarding is configured by default, the following config can be added to
`/opt/splunk/etc/system/local/outputs.conf`:
```
[tcpout]
defaultGroup = NoForward
```

For a more realistic scenario, where there are destinations configured, the `default-autolb-group` could be used
since servers added through the UI are added to this group by default.
```
[tcpout]
defaultGroup = default-autolb-group
```

## INSTALLATION

1. The app will install a tcpout output towards `axorouter:9900` by default. Please either
set up `axorouter` in `/etc/hosts` to resolve to your axorouter IP address or override that by adding the following
to your `/opt/splunk/etc/system/local/outputs.conf`:

```
[tcpout:axoflow]
server = YOUR_HOST1:PORT, YOUR_HOST2:PORT

# configure maxQueueSize to allow for a temporary in-memory buffer if the destination is slow or unavailable
# maxQueueSize = 100MB
# configure a persistentQueueSize to allow for data to be queued on disk if the destination is slow or unavailable
# persistentQueueSize = 1GB
```
> Note: It is recommended to configure either in-memory or on-disk queueing to avoid data loss in case the destination is slow or unavailable.

2. Create a TCP syslog connector on the Axoflow Console for port `9900` and select the `NUL terminated` framing option.
3. Install the Axoflow Forwarder Add-on on the node through the UI.
4. Restart splunkd.

NOTE:
In case of Splunk Cloud Platform instances your options to edit Splunk config files may be limited to what the system permits and/or what other apps make available.


For further details on setting up the Add-on and log forwarding between Splunk Heavy Forwarder and AxoRouter, please see our documentation at:
https://axoflow.com/docs/axoflow/data-sources/appliances/splunk/splunk/

## SUPPORT

In case you need assistance or run into issues, contact us at support@axoflow.com


## DOCUMENTATION

Please find all related documentation in the [Axoflow Documentation](https://axoflow.com/docs/axoflow/data-sources/appliances/splunk/)
