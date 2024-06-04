# CVD-COVID-UK consortium, William N Whiteley, et al., 2024.

import sys, csv, re

codes = [{"code":"140921000119102","system":"icd10"},{"code":"724424009","system":"icd10"},{"code":"444172003","system":"icd10"},{"code":"195205001","system":"icd10"},{"code":"751371000000107","system":"icd10"},{"code":"230716006","system":"icd10"},{"code":"G45.9","system":"icd10"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_02-stroke-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ischemic-ccu002_02-stroke---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ischemic-ccu002_02-stroke---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ischemic-ccu002_02-stroke---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
