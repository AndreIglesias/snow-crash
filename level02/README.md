# Level02 Flag Extraction

In this challenge, our objective is to extract a password from a provided pcap file and save it to `/tmp/level02.txt`.

## Solution Overview

To achieve this, we'll employ a series of commands to analyze the pcap file and extract the relevant data.

```bash
# Read the pcap file, filter packets with the PSH flag set, output in "fields" format, and extract the data field
tshark -r /tmp/level02.pcap \
    -Y "tcp.flags.push == 1" \
    -T fields \
    -e data | \
    xxd -r -p > /tmp/level02.txt

# Print the contents of /tmp/level02.txt
cat /tmp/level02.txt

# Extract the password from /tmp/level02.txt, removing non-printable characters
echo -e "\nReading the flag..."
flag=$(cat /tmp/level02.txt | grep -a "^Password" | awk '{print $2}' | tr -cd [:print:])

# Print the extracted flag
echo -e "\nPassword:\n$flag"  #ft_waNDReL0L
```

## Steps Explained

1. **Reading pcap File**: We use `tshark` to read the pcap file `/tmp/level02.pcap`.
2. **Filtering Packets**: We filter packets to include only those with the Push (PSH) flag set.
3. **Extracting Data**: We output the filtered packets in "fields" format and extract the data field.
4. **Converting Hex to Binary**: The extracted hex data is converted to binary format using `xxd`.
5. **Saving to File**: The binary data is saved to `/tmp/level02.txt`.
6. **Displaying Contents**: We print the contents of the saved file.
7. **Extracting Password**: We search for lines starting with "Password" in the file, extract the password, and remove non-printable characters.
8. **Printing Flag**: Finally, we print the extracted password.

This process results in the extraction and display of the password: `ft_waNDReL0L`.
