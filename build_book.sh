#!/bin/bash
book_name="Burp_Suite_Doc_zh_cn"
gitbook pdf .
mv book.pdf ${book_name}.pdf
echo "[*] Build pdf Finish, This book in `pwd`/_book/${book_name}.pdf"
gitbook mobi .
mv book.mobi ${book_name}.mobi
echo "[*] Build mobi Finish, This book in `pwd`/_book/${book_name}.mobi"
gitbook epub .
mv book.epub ${bookname}.epub
echo "[*] Build epub Finish, This book in `pwd`/_book/${book_name}.epub"
