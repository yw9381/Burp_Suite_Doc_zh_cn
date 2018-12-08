#!/bin/bash
# check tools
for tools in "git" "node" "npm" "ebook-convert" "gitbook";
do
    echo "[***] Check $tools"
    $tools --version > /dev/null 2>&1
    [ "$?" != "0" ]&& echo -e "\033[41m[!!!] Please Install $tools\033[0m"&& exit 1
done
echo "[***] All tools check done. Start build book..."

# build book
mkdir -p ebook

for format in "pdf" "epub" "mobi";
do
    echo "[***] Building $format"
    gitbook $format ./ ./ebook/Burp_Suite_官方文档中文版.$format
    [ "$?" != "0" ]&& echo -e "\033[41m[!!!] Build $format fail!\033[0m"
done

echo "[***] Build finish!"
