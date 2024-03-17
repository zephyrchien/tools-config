import sys
import json
import toml

def json2toml(s):
    return toml.dumps(json.loads(s))

def toml2json(s):
    return json.dumps(toml.loads(s), indent=4)

def main():
    argv = sys.argv
    if len(argv) != 3:
        print('cvt [src] [dst]')
        return
    src, dst = argv[1:]
    print(f'{src} => {dst}')
    with open(src, encoding='utf-8') as fp:
        data = fp.read()
    if src.endswith('.json') and dst.endswith('.toml'):
        cvt_f = json2toml
    elif src.endswith('.toml') and dst.endswith('.json'):
        cvt_f = toml2json
    else:
        print('unknown file type')
        return
    data = cvt_f(data)
    with open(dst, 'w+', encoding='utf-8') as fp:
        fp.write(data)

if __name__ == '__main__':
    main()

