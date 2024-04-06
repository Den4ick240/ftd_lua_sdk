import os
import re
import sys


def get_lua_files():
    lua_files = []
    for root, _, files in os.walk("."):
        if root.startswith("./"):
            root = root[2:]
        if root.startswith("."):
            continue
        for file in files:
            if file.endswith(".lua"):
                lua_files.append(os.path.join(root, file))
    return lua_files


def extract_dependencies(lua_file):
    dependencies = []
    with open(lua_file, 'r') as file:
        content = file.read()
        matches = re.findall(r'require\(["\'](.*?)["\']\)', content)
        dependencies.extend(
            [os.path.join(*match.replace('.lua', '').split('.')) + '.lua' for match in matches])
    return dependencies


def build_dependency_tree(lua_files):
    dependency_tree = {}
    for lua_file in lua_files:
        dependencies = extract_dependencies(lua_file)
        dependency_tree[lua_file] = dependencies
        dependency_tree.update(build_dependency_tree(dependencies))
    return dependency_tree


def get_ordered_files(dependency_tree):
    ordered_files = []

    def traverse_dependencies(file):
        dependencies = dependency_tree[file]
        for dependency in dependencies:
            if dependency not in ordered_files:
                traverse_dependencies(dependency)
        ordered_files.append(file)

    for file in dependency_tree:
        if file not in ordered_files:
            traverse_dependencies(file)

    return ordered_files


def remove_comments_and_requires(content, one_line_comment):
    content = re.sub(r'--\[\[(.*?)\]\]', '', content, flags=re.DOTALL)  # Remove multi-line comments
    content = re.sub(r'--.*', '', content)  # Remove single-line comments
    content = re.sub(r'require\(["\'](.*?)["\']\)', '', content)  # Remove require statements
    content = content.strip()
    if one_line_comment:
        content = content.replace("\n", " ")
    return content


def combine_files(lua_files):
    combined_content = ""
    for lua_file in lua_files:
        with open(lua_file, 'r') as file:
            content = file.read()
            if "-- NO INCLUDE" in content:
                continue
            one_line_comment = "-- ONE LINE" in content
            content = remove_comments_and_requires(content, one_line_comment)
            file_name = os.path.splitext(lua_file)[0].upper()
            import_comment = f"-- IMPORT {file_name}\n"
            combined_content += import_comment + content + '\n\n'
    return combined_content.strip()


def create_result_file(combined_content, output_file):
    result_file_path = os.path.join('.build', output_file)
    os.makedirs(os.path.dirname(result_file_path), exist_ok=True)
    with open(result_file_path, 'w') as file:
        file.write(combined_content)


if __name__ == '__main__':
    if len(sys.argv) == 1:
        lua_files = get_lua_files()
        output_file = 'result.lua'
    else:
        output_file = sys.argv[1]
        lua_files = [output_file]
    dependency_tree = build_dependency_tree(lua_files)
    ordered_files = get_ordered_files(dependency_tree)
    combined_content = combine_files(ordered_files)
    try:
        import pyperclip
        pyperclip.copy(combined_content)
    except ImportError:
        print('Install pyperclip if you want the code automatically copied to clipboard')
    create_result_file(combined_content, output_file)
