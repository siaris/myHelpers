clean(s){
    s.replace(/[^\[\]\(\)\{\}]/g,'').length <= 104
}

str = clean(str)
stack = []
closeBracket = [']','}',')']
openBracket = ['[','{','(']
pairBracket = {']':'[','}':'{',')':'('}
outputStatus = walk(str)
walk(s){
    for(i in s){
        if(in_array(s[i],openBracket)) stack.push(s[i])
        else if(i == 0) return false
        else popS(s[i],i)
    }
    //cek avail
    if(stack.length > 0) return false
    return true
}

popS(s,index){
    if(stack[stack.length - 1] == pairBracket[s]) stack.pop()
    return
}

in_array (needle, haystack) {
	var key = ''
    for (key in haystack) {
        if (haystack[key] == needle) {
            return true;
        }
    }
	return false;
}