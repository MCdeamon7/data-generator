# data-generator

my super data generator
It generate fake data for a defined time period:
columns =["timestamp","mac_address","cpu_max_cycle","cpu_current_cycle","ram_usage","rx_packets","rx_bytes","tx_packets","tx_bytes","flag"]

you have to define some parameters:

-   list of macs (can be done with online generation tools)
-   period and frequency for the data generation

It output everithing in a csv file with the timestamp as index.

### Pro:

MULTI CORE VERSION!!

### Cons:

-   There are still some static variables that is a bit a pain in the butt to configure.
-   The label only return ok, the possible attacks are still to be implemented

The .yml files are for ingesting in elastic/opensearch the data, pls see the documentation to learn more.

splitCsv <Filename> [chunkSize]
chunkSize is optional
I find nice to set chunkSize around 10000000 lines that are a "manageble" size to import into elastic/open-search
