#!/usr/bin/bash
test()
{
a=$(python3 << END
if $errorcode == 0:
    print(' init ok')
else:
    print(f' init fail , errorcode is $errorcode')
END
)
echo  $a
}






#errorcode=$( init -a )
errorcode='12'
test
errorcode='0'
test






input()
{
return_value=$(python3 << END
for i in range(3):
    print(f'ls',r'\n',f'rename foo foo0{i} foo?',r'\n')
    
END
)
echo -e $return_value
}

input

arg_parse()
{
    value=$(python3 << END
import argparse

parser = argparse.ArgumentParser(description='Process some integers.'+r'\n')
parser.add_argument('integers', metavar='N', type=int, nargs='+',
                    help='an integer for the accumulator'+r'\n')
parser.add_argument('--sum', dest='accumulate', action='store_const',
                    const=sum, default=max,
                    help='sum the integers (default: find the max)'+r'\n')
import sys
sys.argv=['arg_parse']+list('$@'.split(' '))
args = parser.parse_args()
print(args.accumulate(args.integers))
END
)
echo -e $value
}
arg_parse $@


arg_parse '-h'
arg_parse '--help'
arg_parse '1 4 -h'
arg_parse '1 4'
arg_parse '1 4 78 --sum' 
