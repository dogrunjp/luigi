#サンプル間のコサイン類似度計算

import pandas as pd
import numpy as np
from numpy.linalg import norm
import sys

input_file = sys.args[1]
output_file = sys.args[2]

df = pd.read_table(input_file)
#転置（カラムにgeneがきているとき）
df_T = df.T
#関数
def cosin_similarity(a, b):
    s = np.dot(a, b) / (norm(a) * norm(b))    
    return s

df_cosin = df_T.corr(method=cosin_similarity)
df_cosin.to_csv(output_file, sep='\t')
