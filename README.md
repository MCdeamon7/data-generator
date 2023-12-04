# data-generator

My super data generator.
It generate fake data for a defined time period and in a more or less defined time of the day ~8am to ~17pm:
columns =["timestamp","mac_address","cpu_max_cycle","cpu_current_cycle","ram_usage","rx_packets","rx_bytes","tx_packets","tx_bytes","flag"]

You have to define some parameters:

-   list of macs (can be done with online generation tools)
-   period and frequency for the data generation

It output everithing in a csv file.

Script explanation:

-   Data generation singlecore: generate data in a slow (but not too much) manner.
-   Data generation multicore gauss: generate data with the metod gauss (made thread safe) with 8 (modifiable) different process in parallel
-   Data generation multicore normal: generate data with the metod normalvariate (thread safe) with 8 (modifiable) different process in parallel

-   Data generation multicore normal_zero: like before but with a twist:

The difference between the normal_zero version and the normal version is:

-   in the zero version if the time isn't between ~8am to ~17pm it still add data but whit all the values to 0.
-   in the non zero version if the time isn't between ~8am to ~17pm just skip the cicle and goes on.

### Pro:

MULTI CORE VERSION!!

### Cons:

-   There are still some static variables that is a bit a pain in the butt to configure.
-   The label only return ok or off for the zeroed version, the possible attacks still needs to be implemented

The .yml files are for ingesting in elastic/opensearch the data, pls see the documentation to learn more.

splitCsv <Filename> [chunkSize]
chunkSize is optional
I find nice to set chunkSize around 10000000 lines that are a "manageble" size to import into elastic/open-search

plot_data is just a really small chunk of code to visualize a bit the generated data.
