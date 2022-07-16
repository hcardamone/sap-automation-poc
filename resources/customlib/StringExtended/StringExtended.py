from robot.libraries.String import *

def split_string_custom(string_input, flag=0):
    chunks, chunk_size = len(string_input), len(string_input)//flag
    # noinspection PyUnusedLocal
    splitcustom = []
    for i in range(0, chunks, chunk_size):
        splitcustom.append(string_input[i:i + chunk_size])
    print(splitcustom)
    return  splitcustom

