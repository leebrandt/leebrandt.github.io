#!/bin/bash

if [ "$#" -ne 1 ] ; then
  echo "Usage: $0 <title>" >&2
  exit 1
fi


title=`echo "$1" |sed 's/ /-/g'`
fileName="_posts/`date +%Y-%m-%d-$title.markdown`"

touch $fileName

cat > $fileName <<DELIM
---
layout: post
title: "$1"
headline:  $1
date:  `date "+%Y-%m-%d %H:%M:%S"`
categories:
---
<!-- more -->

DELIM

vim $fileName +9
