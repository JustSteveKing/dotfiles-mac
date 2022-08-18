# Create a new directory and enter it
function mkd() {
   mkdir -p "$@" && cd "$@"
}

# All the dig info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer
}

archive () {
   zip -r "$1".zip -i "$1" ;
}

function weather() {
   city="$1"

   if [ -z "$city" ]; then
      city="Treherbert"
   fi

   eval "curl http://wttr.in/${city}"
}

function silent() {
   "$@" >& /dev/null
}
