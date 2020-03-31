## Vassilis Palassopoulos

import os

def getAllFiles(dirName):
    return sorted((os.path.join(root, file) for root, dirs, files in os.walk(dirName) for file in files))


def getListofFolders(InputFolder):
    return sorted(next(os.walk(InputFolder))[1])


def folderSizeTree(directory):
    name, size, level = [], [], []
    dir_size = 0
    for root, dirs, files in os.walk(directory, topdown=False):
        dirpath = root + os.path.sep
        depth = dirpath[len(directory) + len(os.path.sep):].count(os.path.sep)
        name += [root]
        size += [get_tree_size(root)]
        level += [depth]
    return name, size, level


def get_tree_size(path):
    total = 0
    for entry in os.scandir(path):
        if entry.is_dir(follow_symlinks=False):
            total += get_tree_size(entry.path)
        else:
            total += entry.stat(follow_symlinks=False).st_size
    return total


def Read_protocol_file(ProtocolsFile):
    return [line.rstrip('\n') for line in open(ProtocolsFile) if line != '\n']


def get_protocol_names(ProtocolsFile, ProcessingSTep, MRIModality):
    C = [line.rstrip('\n') for line in open(ProtocolsFile) if line != '\n']
    match = C.index(ProcessingSTep)
    subset = C[match+1:]
    match = next((e for e, x in enumerate(subset) if x not in MRIModality),len(subset)-1)
    subset = subset[match:]
    match = next((e for e, x in enumerate(subset) if ('__' or '[]') in x),len(subset)-1)
    return subset[:match]


def pickfiles(directory0, filtand, filtor=None, filtnot=None):
    files = getAllFiles(directory0)
    filesf = []
    for file in files:
        chkand = (filt in file for filt in filtand)
        chkor = [True] if not filtor else (filt in file for filt in filtor)
        chknot = [True] if not filtnot else (filt not in file for filt in filtnot)
        if all((all(chkand), any(chkor), all(chknot))):
            filesf.append(file)
    return filesf
