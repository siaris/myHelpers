<script>
    var walkBaseballStack = function (){
    var stackSolution = []
    var intRange = Array.from({length: (2*(3*104)) + 1}, (_, i) => i - (3*104))
    
    function init(arr){
        stackSolution = []
        if(clean(arr)) outputStatus = walk(arr)
        if(stackSolution.length > 0) return stackSolution.reduce((a, b) => a + b, 0)
        else return null
    }

    function clean(s){
        if(s.length <= 1000) 
            return s
        return false
    }

    function walk(s){
        for(i in s){
            switch(s[i]){
                case 'C' :
                case 'D' :
                case '+' :
                //must at least one elem
                    if (DoCalc(s[i]) === false) return false
                break
                case inArray(s[i],intRange):
                    stackSolution.push(parseInt(s[i]))
                break
                default: return false
                break
            }
        } 
    }

    function DoCalc(c){
        switch(c){
            case '+': 
                if(stackSolution.length >= 2) stackSolution.push(parseInt(stackSolution[stackSolution.length-1]) + parseInt(stackSolution[stackSolution.length-2])) 
                else return false    
                break
            default:
                if(stackSolution.length >= 1){
                    if(c == 'D') stackSolution.push(parseInt(stackSolution[stackSolution.length-1] * 2))
                    else stackSolution.pop()
                } else return false 
                break
        }
        return true
    }

    function inArray (needle, haystack) {
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
console.info(walkBaseballStack.init(["9","-4"]))
</script>