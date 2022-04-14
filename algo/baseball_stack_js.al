clean(s){
    if(s.match(/(\d)+[C|D|+|(\d)]*/g)[0] == s && s.length <= 1000) return s
    return false
}

stackSolution = []
intRange = Array.from({length: (2*(3*104)) + 1}, (_, i) => i - (3*104))
if(clean(str)){
    outputStatus = walk(str)
}

walk(s){
    for(i in s){
        switch(s[i]){
            case if(in_array(s[i],['C','D','+'])) : 
            //must at least one elem
            var re = DoCal(s[i])
            if (re === false) return re
            break
            default :  
            //int  must in range
            if(in_array(s[i],intRange)) stackSolution.push(s[i])
            return false
            break
        }
    }
    //cek avail
    if(stackSolution.length > 0) return stackSolution.reduce((a, b) => a + b, 0)
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