# CVD-COVID-UK consortium, William N Whiteley, et al., 2024.

import sys, csv, re

codes = [{"code":"20059004","system":"icd10"},{"code":"195209007","system":"icd10"},{"code":"16002031000119100","system":"icd10"},{"code":"16002031000119102","system":"icd10"},{"code":"230691006","system":"icd10"},{"code":"16002111000119100","system":"icd10"},{"code":"16000511000119100","system":"icd10"},{"code":"734384004","system":"icd10"},{"code":"734383005","system":"icd10"},{"code":"195211003","system":"icd10"},{"code":"195210002","system":"icd10"},{"code":"75543006","system":"icd10"},{"code":"16000511000119103","system":"icd10"},{"code":"71444005","system":"icd10"},{"code":"16002111000119106","system":"icd10"},{"code":"195211003","system":"icd10"},{"code":"195210002","system":"icd10"},{"code":"195216008","system":"icd10"},{"code":"195209007","system":"icd10"},{"code":"195206000","system":"icd10"},{"code":"G46.1","system":"icd10"},{"code":"G46.0","system":"icd10"},{"code":"G46.2","system":"icd10"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_02-stroke-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["intracerebral-ccu002_02-stroke---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["intracerebral-ccu002_02-stroke---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["intracerebral-ccu002_02-stroke---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
