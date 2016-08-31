# Li Zheng <6007381@qq.com>
# 2016-04-01

function lhanslir()
{
    if [[ $# -ge 1 ]]; then
        mtu=$1
    else
        mtu=1400
    fi
    sudo ~/work/hans/hans -c 106.186.28.188 -p lirlir -n lirlir -m $mtu
}

function lsshlir()
{
    ssh -CNfg -D 127.0.0.1:28888 lir@10.50.50.1
}

function xfind()
{
    find . -name .repo -prune -o -name .git -prune -o  -type f -name "*$**" -print
}

function xfindi()
{
    find . -name .repo -prune -o -name .git -prune -o  -type f -iname "*$**" -print
}

function jgrep()
{
    find . -name .repo -prune -o -name .git -prune -o  -type f -name "*\.java" -print0 | xargs -0 ag "$*"
}

function jgrepi()
{
    find . -name .repo -prune -o -name .git -prune -o  -type f -name "*\.java" -print0 | xargs -0 ag -i "$*"
}

function cgrep()
{
    find . -name .repo -prune -o -name .git -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' \) -print0 | xargs -0 ag "$*"
}

function cgrepi()
{
    find . -name .repo -prune -o -name .git -prune -o -type f \( -name '*.c' -o -name '*.cc' -o -name '*.cpp' -o -name '*.h' \) -print0 | xargs -0 ag -i "$*"
}

function resgrep()
{
    for dir in `find . -name tags -prune -o -name cscope.out -prune -o -name .repo -prune -o -name .git -prune -o -name res -type d`; do find $dir -type f -name '*\.xml' -print0 | xargs -0 ag "$*"; done;
}

function resgrepi()
{
    for dir in `find . -name tags -prune -o -name cscope.out -prune -o -name .repo -prune -o -name .git -prune -o -name res -type d`; do find $dir -type f -name '*\.xml' -print0 | xargs -0 ag -i "$*"; done;
}

# Makefile
function mgrep()
{
    find . -name .repo -prune -o -name .git -prune -o  -type f \( -name "Makefile" -o -name '*.mk' -o -name '*.cmake' \) -print0 | xargs -0 ag "$*"
}

function mgrepi()
{
    find . -name .repo -prune -o -name .git -prune -o  -type f \( -name "Makefile" -o -name '*.mk' -o -name '*.cmake' \) -print0 | xargs -0 ag -i "$*"
}

# pdf
function pgrep()
{
    find . -name '*.pdf' -print -exec pdftotext {} /tmp/tmp.txt \; -exec grep --color "$*" /tmp/tmp.txt \;
}

function pgrepi()
{
    find . -name '*.pdf' -print -exec pdftotext {} /tmp/tmp.txt \; -exec grep -i --color "$*" /tmp/tmp.txt \;
}

function xgrep()
{
    find . -name tags -prune -o -name cscope.out -prune -o -name .repo -prune -o -name .git -prune -o  -type f -name "*" -print0 | xargs -0 ag "$*"
}

function xgrepi()
{
	find . -name tags -prune -o -name cscope.out -prune -o -name .repo -prune -o -name .git -prune -o  -type f -name "*" -print0 | xargs -0 ag -i "$*"
}
