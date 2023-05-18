# psping.sh  

## Description
This is a simple Bash script designed to monitor a specific executable process running on a Unix-based system. It continually checks whether the process is running at specified intervals. The script can also be used to monitor processes for a particular user.

## Usage
To run the script, follow the steps:

1. Open your terminal.
2. Navigate to the location of the script.
3. Run the script using the bash command followed by the script name and required parameters.
```bash
script.sh -c <pingAmount> -t <timeoutSec> -u <userName> <exeName>
```

Where:

`pingAmount`: The number of times the script should check if the process is running. Use -1 for infinite loop.
`timeoutSec`: The amount of time (in seconds) the script should wait between checks.
`userName`: The name of the user whose processes should be monitored. If this argument is omitted, the script will monitor the process for all users.
`exeName`: The name of the process that should be monitored.
Here's an example of usage:

```bash
script.sh -c 10 -t 2 -u john processName
```

This command will check every 2 seconds whether the process processName run by user 'john' is running. It will do this check 10 times.

Note
This script uses `ps -ef`, `grep`, and `wc -l`:

`ps -ef`: Displays information about a selection of the active processes. ps is a utility which shows information concerning a selection of the current active processes. -ef specifies the full-format listing.

`grep`: grep is a command-line utility for searching plain-text data sets for lines that match a regular expression. In this case, it's used to filter processes by name and by user.

`wc -l`: The wc (word count) command in Unix/Linux operating systems is used to find out number of newline count, word count, byte and characters count in a files specified by the file arguments. The -l option is for counting the number of lines.
You need to make sure that these tools are installed in your system to be able to use this script. They are usually installed by default on most Unix-based systems, including Linux distributions and macOS. If not, please refer to your operating system's documentation for instructions on how to install these packages.


### Disclaimer
This script might not accurately report the number of instances for processes with similar names or processes run by users with similar names due to the way grep works. Always cross-check the results with other system monitoring tools.