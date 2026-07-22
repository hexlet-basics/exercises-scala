#!/usr/bin/env bash

actual=$(scala-cli run --server=false --jvm system index.scala 2>/dev/null)
expected="Hello, World!"

if [ "$actual" != "$expected" ]; then
  echo "Expected '$expected', but got '$actual'"
  exit 1
fi
