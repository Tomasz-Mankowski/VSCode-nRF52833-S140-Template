import sys
import platform


if __name__ == "__main__":
    name = sys.argv[1]

    compilerPath = sys.argv[2]
    if platform.system() == 'Windows':
        compilerPath += '.exe'

    includePathCount = int(sys.argv[3])
    includePath = sys.argv[4:4+includePathCount]
    
    defines = [v[len('-D'):] for v in sys.argv[4+includePathCount:] if v.startswith('-D')]

    file = open(".vscode/c_cpp_properties.json", "w")
    

    file.write('{\n')
    file.write('    "configurations": [\n')
    file.write('        {\n')

    file.write('            "name": "' + name + '",\n')

    file.write('            "includePath": [\n')
    for i, path in enumerate(includePath):
        file.write('                "' + path + '"')
        if i != includePathCount - 1:
            file.write(',')
        file.write('\n')
    file.write('            ],\n')

    file.write('            "defines": [\n')
    definesCount = len(defines)
    for i, define in enumerate(defines):
        file.write('                "' + define + '"')
        if i != definesCount - 1:
            file.write(',')
        file.write('\n')
    file.write('            ],\n')

    file.write('            "compilerPath": "${env:GNU_GCC}/arm-none-eabi-gcc.exe",\n')

    file.write('            "cStandard": "c11",\n')
    file.write('            "cppStandard": "c++17",\n')
    file.write('            "intelliSenseMode": "gcc-arm"\n')
    file.write('        }\n')
    file.write('    ],\n')
    file.write('    "version": 4\n')
    file.write('}')

    file.close()

    exit(0)