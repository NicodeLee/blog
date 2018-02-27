#!/bin/bash
if [[ $# -lt 1 ]]; then
	echo "Usage: $0 markdown_file"
	exit 1
fi
tag_line=4
markdown_file=$1
if [[ ! -f $markdown_file ]]; then
	echo "file $markdown_file not exist!"
	exit 2
fi
u_home=$(echo ~)
posted_file=$(basename $markdown_file | sed 's/.md$//' | awk '{print "\""$0"\""}' | xargs hexo new | tee /dev/stderr | awk '{print $NF}' | sed 's@^~@'"${u_home}"'@')
if [[ ! -f $posted_file ]]; then
	echo "file $posted_file not exist!"
	exit 2
fi
echo "cat $markdown_file >> $posted_file"
cat $markdown_file >> $posted_file
hexo list tag
read -p "tag(muti tags with ';'): " tag_list
if [[ $tag_list != "" ]]; then
	for tag in `echo $tag_list | sed 's/;$//' | sed 's\;\ \g'`; do
		sed -i "${tag_line}a- ${tag}" $posted_file
		let tag_line=$tag_line+1
	done
fi
# hexo d -g
echo "Done!"