import csv
rows = []
with open('flops.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        if len(row) == 8:
            rows.append(row)

flop = 0
for row in rows:
    if(row[3][:4] == 'flop'):
        flop += float(row[7])

rows = []
watt = 0
time = 0
with open('time_power.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        if len(row) == 6 or len(row) == 8:
            rows.append(row)

for row in rows:
    if len(row) == 8:
        if row[0] == 'GPU activities':
            time += float(row[2])
    if len(row) == 6:
        if row[0] == "Power (mW)":
            watt += (float(row[3])/1000)

gflops = (flop/time)/1000000000
gflops_watt = gflops/watt
print(gflops_watt)
