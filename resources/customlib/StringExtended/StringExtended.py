from robot.libraries.String import *

def split_list_custom(string_input, flag=0):
    chunks, chunk_size = len(string_input), len(string_input)//flag
    # noinspection PyUnusedLocal
    splitcustom = []
    for i in range(0, chunks, chunk_size):
        splitcustom.append(string_input[i:i + chunk_size])
    print(splitcustom[i])
    return  splitcustom

def get_line_count_custom(string):
    list = string
    result = [c for c in list[0]]
    return list

def remove_list_using_regexp(self, string_input, *patterns):
    list = string_input
    result = [c for c in list[0]]
    # noinspection PyUnusedLocal
    for pattern in patterns:
        string_input = self.remove_list_using_regexp(list, pattern, '')
    return result, string_input

