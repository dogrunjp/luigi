import numpy as np
from numpy.linalg import norm
import csv

default_file_name = '/Users/oec/Documents/Jupyter/aoe/T-TPM.txt'
output_file_name = 'data/result_final.txt'


def get_index():
    with open(default_file_name, 'rb') as input_f:
        names = [row.split()[0].decode('utf-8') for row in input_f]
    return names


def get_col_len():
    with open(default_file_name, 'rb') as input_f:
        for i, row in enumerate(input_f):
            sample_list = row.split()
            if i >= 0:
                break
    return sample_list


def load_data():
    cols = len(get_col_len())
    # ヘッダを飛ばし＆idカラムの次の列から取得
    data = np.loadtxt(default_file_name, delimiter='\t', skiprows=1, usecols=range(1, cols))
    return data


def calc():
    data = load_data()
    header = get_index()
    names = header[1:]
    f = open(output_file_name, 'w')
    writer = csv.writer(f, delimiter='\t', lineterminator='\n')
    writer.writerow(header)

    for i in range(len(data)):
        v1 = data[i]
        v = []
        for j in range(len(data)):
            v2 = data[j]
            n1 = norm(v1)
            n2 = norm(v2)
            s = np.dot(v1, v2) / (n1 * n2)
            v.append(s)

        v.insert(0, names[i])
        writer.writerow(v)

    f.close()


calc()
