# use python in shell script

```
value=$(python3 << END
if $errorcode == 0:
    print('init ok')
else:
    print(f'init fail , errorcode is $errorcode')
END
)
echo $value
```