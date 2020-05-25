# 数值判断
def chkNum(source):
    if isinstance(source,float):
        return source
    elif isinstance(source,int):
        return source
    else:
        return 0.0