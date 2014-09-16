#!/bin/bash

curl -is "https://wikileaks.org/spyfiles4/customers.html" -O customers.html
cat customers.html | php -r '$buy[]=array();$a=file_get_contents("php://stdin");preg_match_all("|<td><a class\"accordion-toggle\".*>(.*)</a></td>.*<td>(.*)</td>.*<table class=\"table table-striped table-bordered\">(.*)</table>|Uims",$a,$o);/*print_r($o);*/for($i=0;$i<count($o[1]);$i++){if(!isset($buy[$o[1][$i]])){$buy[$o[1][$i]]=array();$buy[$o[1][$i]]["data"]=array();}$buy[$o[1][$i]]["name"]=$o[2][$i];preg_match_all("|<tr.*>(.*)</tr>|Uims",$o[3][$i],$p);/*print_r($p);*/for($r=0;$r<count($p[1]);$r++){preg_match_all("|<td>(.*)</td>|Uims",$p[1][$r],$l);/*print_r($l);*/$l[1]=array_map("strip_tags",$l[1]);if($r>0){$buy[$o[1][$i]]["data"][]=$l[1];}}}print_r($buy);'
