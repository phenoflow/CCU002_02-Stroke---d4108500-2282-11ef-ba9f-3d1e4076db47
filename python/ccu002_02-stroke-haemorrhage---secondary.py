# CVD-COVID-UK consortium, William N Whiteley, et al., 2024.

import sys, csv, re

codes = [{"code":"I61","system":"icd10"},{"code":"195165005","system":"icd10"},{"code":"1078001000000105","system":"icd10"},{"code":"274100004","system":"icd10"},{"code":"195168007","system":"icd10"},{"code":"276722003","system":"icd10"},{"code":"230710000","system":"icd10"},{"code":"230711001","system":"icd10"},{"code":"230709005","system":"icd10"},{"code":"308128006","system":"icd10"},{"code":"230712008","system":"icd10"},{"code":"75038005","system":"icd10"},{"code":"732923001","system":"icd10"},{"code":"195169004","system":"icd10"},{"code":"7713009","system":"icd10"},{"code":"I60","system":"icd10"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_02-stroke-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_02-stroke-haemorrhage---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_02-stroke-haemorrhage---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_02-stroke-haemorrhage---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
