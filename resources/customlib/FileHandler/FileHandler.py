import os
import logging
import codecs
import shutil

class FileHandler:

    def check_difference_files(self, input_files, output_file):
        output_file_contents = []
        with open(output_file, 'r') as output_file_obj:
            for i, output_line in enumerate(output_file_obj):
                output_line = output_line.strip()
                output_file_contents.append(output_line)
        has_error = False
        for input_file in input_files:
            input_file_contents = []
            try:
                with open(input_file, 'r') as input_file_obj:
                    for i, input_line in enumerate(input_file_obj):
                        input_line = input_line.strip()
                        input_file_contents.append(input_line)
            except FileNotFoundError as e:
                logging.error("Input file not found: %s", input_file)
                has_error = True
                continue
            diff = set(input_file_contents) - set(output_file_contents)
            if diff:
                not_found = []
                for item in sorted(diff):
                    if item in output_file_contents:
                        output_index = output_file_contents.index(item)
                        logging.error("Line in input file: %s", item)
                        logging.error("Corresponding line in output file: %s", output_file_contents[output_index])
                    else:
                        not_found.append(item)
                if not_found:
                    has_error = True
                    logging.error("Files with failed matches:")
                    logging.error("Input file %s lines were not found in the output file:", input_file)
                    for item in not_found:
                        logging.error("Line not found in output file: %s", item)
            else:
                logging.info("Files with successful matches:")
                logging.info("Input file %s contents match output file contents.", input_file)
        if has_error:
            raise AssertionError("One or more input files was failed")

    def normalize_file(self, input_file, input_relative_path):
        assert os.path.isfile(input_file), f"The input file {input_file} does not exist!"
        encodings = ['utf-8', 'ISO-8859-1', 'latin-1', 'ascii', 'asc', 'windows-1252']
        input_contents = []
        input_file_obj = None
        for encoding in encodings:
            try:
                input_file_obj = open(input_file, 'r', encoding=encoding)
                input_contents = input_file_obj.readlines()
                break
            except UnicodeDecodeError:
                continue
        if input_file_obj is None:
            print(f"Could not open input file {input_file} with any of the following encodings: {', '.join(encodings)}")
            return
        input_normalized_contents = []
        for input_normalized_line in input_contents:
            semicolons_count = input_normalized_line.count(';')
            if semicolons_count == 3:
                input_normalized_line = input_normalized_line[::-1].replace(';', ';;', 1)[::-1]
            input_normalized_line = ' '.join(input_normalized_line.strip().split())
            input_mapping_table = str.maketrans("àáâãäåçèéêëìíîïñòóôõöøùúûüýÿ", "aaaaaaceeeeiiiinoooooouuuuyy")
            input_normalized_line = input_normalized_line.translate(input_mapping_table)
            input_normalized_contents.append(input_normalized_line)
        input_normalized_path = ''
        input_path, input_ext = os.path.splitext(input_file)
        normalized_input_file = os.path.join(input_relative_path, input_path.split('/')[-1] + "_normalized" + input_ext)
        with open(normalized_input_file, 'w', encoding=encoding) as input_file_obj:
            input_file_obj.write('\n'.join(input_normalized_contents).strip())
            input_normalized_path = os.path.abspath(normalized_input_file)
            print(input_normalized_path)
        print("Files normalized successfully!")
        return input_normalized_path
