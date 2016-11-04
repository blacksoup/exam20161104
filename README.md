# Specification
## Description
 - We would really need a daemon application that collects the monitoring statistics of a server , like disk usage, CPU load, memory usage, etc.
 - The script needs to collect the data using standard linux commands.
 - The application needs to be configurable (config.json included):
    - The api_key (see later) needs to be defined here
    - The url to send the data to needs to be defined here
 - We need the following data
    - Used memory in a percentage format  (string) with 2 decimal points (e.g.: 22.45), without the % character.
    - Used cpu load in a percentage format  (string) with 2 decimal points (e.g.: 22.45), without the % character.
    - Used disk space percentage for the root partition (string) with 2 decimal points (e.g.: 22.45), without the % character.
 - If the monitoring data has been gathered and parsed by the batch application, it would have to structure it and encode it into a JSON format and send it to a monitoring api, which would then parse and store the data for later usage.
    - The monitoring api doesn't have to be implemented in this task, only the api call part. You will need to mock the api caller obejct since we will not provide you a valid url. The api response is not important for you, you can ignore it.
    - The JSON has to be sent via a standard POST api call with the following parameters (with these keys):
        - api_key: The special token that identifies the server. The key is a standard string (pre generated md5 hash).
        - data: The JSON encoded string, that contains the monitoring data.
    - The api call has to be configurable (URL parameter from config).

 
        
### JSON structure
 - The following structure is an example, how the JSON should look like:
```json
    {
    	"cpu": {},
    	"hdd": {},
    	"memory": {}
    }
```
 
### Example scripts and outputs:
 - Memory usage:
```sh
    example@somepc:/home/example# free
                 total       used       free     shared    buffers     cached
    Mem:       4110304    3890588     219716     102136     371728    2694696
    -/+ buffers/cache:     824164    3286140
    Swap:      1048572          0    1048572
```

- Disk usage:
```sh
    example@somepc:/home/example# df -h
    Filesystem      Size  Used Avail Use% Mounted on
    /dev/xvda2       30G   24G  4.7G  84% /
    udev             10M     0   10M   0% /dev
    tmpfs           803M   95M  709M  12% /run
    tmpfs           2.0G     0  2.0G   0% /dev/shm
    tmpfs           5.0M     0  5.0M   0% /run/lock
    tmpfs           2.0G     0  2.0G   0% /sys/fs/cgroup
    tmpfs           1.0M     0  1.0M   0% /storage
```
- CPU statistics:

```sh
    example@somepc:/home/example# mpstat -P ALL
    Linux 3.16.0-4-amd64 (somepc)       11/03/2016      _x86_64_        (4 CPU)
     
    06:22:38 PM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
    06:22:38 PM  all    0.81    0.00    1.12    0.19    0.00    0.00    0.01    0.00    0.00   97.86
    06:22:38 PM    0    0.79    0.00    0.96    0.44    0.00    0.01    0.03    0.00    0.00   97.76
    06:22:38 PM    1    0.78    0.00    1.25    0.14    0.00    0.00    0.01    0.00    0.00   97.82
    06:22:38 PM    2    0.96    0.00    1.41    0.10    0.00    0.00    0.01    0.00    0.00   97.52
    06:22:38 PM    3    0.71    0.00    0.85    0.09    0.00    0.00    0.01    0.00    0.00   98.34
```

### Checkpoints
 These are the checkpoints that you need to keep in mind during development:
 1. The application **can parse** the memory usage.
 2. The application **can export** the memory usage into the output format that needs to be sent.
 3. The application **can send** the data to the server.
 4. The application **can parse** the disk usage.
 5. The application **can export** the disk usage into the output format that needs to be sent.
 6. The application **can send** all the data to the server. 
 7. The application **can parse** the CPU usage into it's internal structure.
 8. The application **can export** the CPU usage into the output structure that needs to be sent.
 9. The application **can send** all the data to the server.

 
### Development guidelines
The application should be well structured and well tested, that’s what counts more. 
You should concentrate on a proper structural design and not on implementing everything as fast as you can.
The checkpoints are there to guide you through the development phases. 
