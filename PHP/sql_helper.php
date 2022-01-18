function set_query_typeahead($q, $fields=array(),$separator=" ") {
    $q_explode = explode($separator,$q);
    $i = 0;
    foreach($fields as $field){
        foreach($q_explode as $str){
            $add_filter[$i][] = $field." LIKE '%".$str."%'";
        }
        $add_filter_str[] = implode(' AND ',$add_filter[$i]);
        $i++;
    }
    
    $return = '(('.implode(') OR (',$add_filter_str).'))';
    return $return;
}

function set_order_exactmatch($field='name',$str_exact='',$order_type_after_rlike='ASC'){
    return 'ORDER BY '.$field.' RLIKE "'.$str_exact.'" DESC, '.$field.' '.$order_type_after_rlike;
}

function neste_replace_mysql($field,$arr_char_to_replace=array(''),$arr_replace_by=array('')){
    $return = $field;
    foreach($arr_char_to_replace as $key=>$to_replace){
        $return = 'REPLACE('.$return.',"'.$arr_char_to_replace[$key].'","'.$arr_replace_by[$key].'")';
    }
    return $return;
}