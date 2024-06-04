# CVD-COVID-UK consortium, William N Whiteley, et al., 2024.

import sys, csv, re

codes = [{"code":"230704000","system":"icd10"},{"code":"276219001","system":"icd10"},{"code":"307363008","system":"icd10"},{"code":"195186005","system":"icd10"},{"code":"1089411000000104","system":"icd10"},{"code":"195185009","system":"icd10"},{"code":"1089421000000100","system":"icd10"},{"code":"230700009","system":"icd10"},{"code":"195189003","system":"icd10"},{"code":"230695002","system":"icd10"},{"code":"432504007","system":"icd10"},{"code":"230692004","system":"icd10"},{"code":"95457000","system":"icd10"},{"code":"426107000","system":"icd10"},{"code":"195190007","system":"icd10"},{"code":"307766002","system":"icd10"},{"code":"230696001","system":"icd10"},{"code":"230698000","system":"icd10"},{"code":"230693009","system":"icd10"},{"code":"1089421000000105","system":"icd10"},{"code":"230701008","system":"icd10"},{"code":"1089411000000100","system":"icd10"},{"code":"95460007","system":"icd10"},{"code":"230694003","system":"icd10"},{"code":"125081000119106","system":"icd10"},{"code":"307767006","system":"icd10"},{"code":"195230003","system":"icd10"},{"code":"413102000","system":"icd10"},{"code":"I63.5","system":"icd10"},{"code":"I63.9","system":"icd10"},{"code":"I63","system":"icd10"},{"code":"I63.0","system":"icd10"},{"code":"I63.3","system":"icd10"},{"code":"I63.4","system":"icd10"},{"code":"I63.1","system":"icd10"},{"code":"I63.2","system":"icd10"},{"code":"230707007","system":"icd10"},{"code":"230706003","system":"icd10"},{"code":"230708002","system":"icd10"},{"code":"I64","system":"icd10"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_02-stroke-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_02-stroke-infarct---secondary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_02-stroke-infarct---secondary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_02-stroke-infarct---secondary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
