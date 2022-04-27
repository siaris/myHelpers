<script>
var stackOfBracketValidator = function (){
    var closeBracket = [']','}',')'],
    openBracket = ['[','{','('],
    pairBracket = {']':'[','}':'{',')':'('},
    stack = []
    
    function init(str){
        if(str.length <= 104 && str.length > 0 && /[^\[\]\(\)\{\}]/.test(str) === false){ 
            walk(str)
        }    
        else return false
        return (stack.length == 0)?true:false
    }

    function walk(s){
        for(i in s){
            if(in_array(s[i],openBracket)) stack.push(s[i])
            else if(i == 0) return false
            else popS(s[i],i)
        }
        if(stack.length > 0) return false
        return true
    }

    function popS(s,index){
        if(stack[stack.length - 1] == pairBracket[s]) stack.pop()
        return
    }

    function in_array (needle, haystack) {
        var key = ''
        for (key in haystack) {
            if (haystack[key] == needle) {
                return true;
            }
        }
        return false;
    }

    return {
        init: init
    }
}()
console.info(stackOfBracketValidator.init("[]{[[]]}["))
</script>