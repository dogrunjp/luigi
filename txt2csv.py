import pandas as pd
import sys
 
args = sys.argv
input_txt = args[1]
output_csv = args[2]


df = pd.read_csv(input_txt, sep='\t')
df.to_csv(output_csv, sep='\t', header=False, index=False)