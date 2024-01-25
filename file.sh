#/bin/bash
#determine file information 
echo "please enter file path "
read path
function info(){
ls -l $path
}
info


